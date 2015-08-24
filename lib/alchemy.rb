require 'alchemyapi'

class AlchemyParser
  attr_accessor :text
  attr_accessor :text_chunks
  attr_reader :keywords
  attr_reader :concepts

  def initialize(text, byte_limit)
    @text = text
    @text_chunks = chunk_text(byte_limit)
    @api = AlchemyAPI.new(Rails.application.secrets.alchemy_api_key)
  end

  # Divides text up into chunks for
  #  submitting to AlchemyAPI.
  def chunk_text(bytes)
    chunks = Array.new
    line = ""

    @text.split(" ").each do |word|
      if line.length + word.length <= bytes
        line << " #{word}"
      else
        chunks << line
        line = word
      end
    end

    chunks << line
    return chunks
  end

  def keywords
    @keywords ||= generate :keywords
  end

  def concepts
    @concepts ||= generate :concepts
  end

  def generate(object)
    valid_objects = [:keywords, :concepts]
    return false unless valid_objects.include?(object)
    kw = Hash.new

    @text_chunks.each do |chunk|
      result = @api.send(object,'text',chunk)
      next if result["status"] == "ERROR"
      result_keywords = Hash[ result[object.to_s].map { |i| [i["text"], i["relevance"]] } ]
      # keywords will get added to kw; duplicate keywords from multiple chunks
      #  will have their relevances appended
      result_keywords.each do |k, v|
        if kw[k]
          kw[k] << v
        else
          kw[k] = [v]
        end
      end
    end
    return kw
  end
end
