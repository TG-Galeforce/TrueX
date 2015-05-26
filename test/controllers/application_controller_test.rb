require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  # The following test is really three tests in 1 so as to limit the number of
  # times I query the Twitter API (since there's a tight allownace on how often I can do that).
  test "should get title, div, h1" do
    get :hello
    assert_response :success
    assert_select "title", "TrueX"
    assert_select "div", "hello, world!"
    assert_select "h1", "Recent tweets by trueX:"
  end

end