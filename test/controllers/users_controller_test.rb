require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.new(username: "testUser", email: "testUsertest@mail.com", password: "testUsertest")
  end

  test "should get users_index" do
    get users_url
    assert_response :success

    assert_select 'h1', 'Listing All Users'
  end

  test "should get users_new" do
    get signup_url
    assert_response :success

    assert_select 'h1', 'Sign Up to RecipeList.com!'
  end

  test "should get users_edit" do
    get edit_user_url(@user)
    assert_response :success

    assert_select 'h1', 'Edit Your Account Details'
  end

  test "should get users_show" do
    get user_url(@user)
    assert_response :success
  end

end