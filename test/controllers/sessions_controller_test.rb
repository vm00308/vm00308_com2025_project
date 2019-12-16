require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.new(username: "testUser", email: "testUsertest@mail.com", password: "testUsertest")
  end

  test "should get sessions_new" do
    get login_url
    assert_response :success

    assert_select 'h1', 'Log In to RecipeList.com!'
  end

end