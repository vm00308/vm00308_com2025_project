require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  test "should get welcome_home" do
    get root_url
    assert_response :success

    assert_select 'h1', 'Welcome to RecipeList.com!'
  end

  test "should get welcome_about" do
    get about_url
    assert_response :success

    assert_select 'h1', 'About RecipeList.com'
  end

  test "should get welcome_contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'h1', 'Contact Us'
    assert_select 'h3', 'Please complete the form below to send us any suggestions for RecipeList.com and to get in touch with us!'
  end

  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:danger]
    assert_nil flash[:success]
  end

  test "should post request contact" do
    post request_contact_url, params: {email: "test@me.com", message: "Hello test"}
    assert_response :redirect
    assert_not_empty flash[:success]
    assert_nil flash[:danger]
  end

end