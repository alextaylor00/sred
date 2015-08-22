require 'test_helper'

class AlchemyApiTest < ActionDispatch::IntegrationTest

  test "AlchemyAPI key should be valid" do
    alchemy = AlchemyAPI.new(Rails.application.secrets.alchemy_api_key)
    response = alchemy.keywords("text","test text")
    assert_equal response["status"], "OK"
  end



end
