require 'test_helper'

class ViewControllerTest < ActionController::TestCase
  test "should get standard" do
    get :standard
    assert_response :success
  end

end
