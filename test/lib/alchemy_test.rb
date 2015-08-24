require 'test_helper'
require 'alchemy'

class AlchemyParserTest < ActionDispatch::IntegrationTest
  test "alchemy parser: chunks text correctly" do
    byte_limit = 765
    lorem_ipsum = File.read(File.expand_path('../../fixtures/loremipsum.txt', __FILE__))

    a = AlchemyParser.new(lorem_ipsum, byte_limit)
    a.text_chunks.each do |chunk|
      assert chunk.length <= byte_limit
    end
  end

  test "alchemy parser: returns keywords" do
    byte_limit = 765
    lorem_ipsum = File.read(File.expand_path('../../fixtures/loremipsum.txt', __FILE__))

    a = AlchemyParser.new(lorem_ipsum, byte_limit)
    assert_not_empty a.keywords
  end

  test "alchemy parser: returns concepts" do
    byte_limit = 765
    lorem_ipsum = File.read(File.expand_path('../../fixtures/loremipsum.txt', __FILE__))

    a = AlchemyParser.new(lorem_ipsum, byte_limit)
    assert_not_empty a.concepts
  end

end
