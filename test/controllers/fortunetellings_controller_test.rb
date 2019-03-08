require 'test_helper'

class FortunetellingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fortunetellings_show_url
    assert_response :success
  end

end
