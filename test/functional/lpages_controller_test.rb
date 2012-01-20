require 'test_helper'

class LpagesControllerTest < ActionController::TestCase
  test "should get development" do
    get :development
    assert_response :success
  end

end
