require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  test "should get title" do
    get :hello
    assert_response :success
    assert_select "title", "TrueX"
  end

  test "should get 'hello, world!'" do
    get :hello
    assert_response :success
    assert_select "div", "hello, world!"
  end
end