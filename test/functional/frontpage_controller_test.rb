require 'test_helper'

class FrontpageControllerTest < ActionController::TestCase
  test "should get frontpage" do
    get :frontpage
    assert_response :success
  end

end
