require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get friends" do
    get :friends
    assert_response :success
  end

end
