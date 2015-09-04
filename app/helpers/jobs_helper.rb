module JobsHelper
  def unescape_and_format(text)
    text = text.gsub('\\n',"\n") # remove newlines
    text = text.gsub("\t"," ") # convert tabs to spaces
    text = text.gsub(">","&gt;") # convert greater than/less than to html chars
    text = text.gsub("<","&lt;")
    text = text.gsub("\\\\","\\") # remove escaped backslashes
    simple_format(text)
  end
end
