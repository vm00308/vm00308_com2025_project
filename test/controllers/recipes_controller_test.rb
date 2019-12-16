require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.create(username: "testUser", email: "testUsertest@mail.com", password: "testUsertest")
    @recipe = Recipe.new(name: "test Recipe", description: "this is the test Recipe description!", user_id: @user.id)
  end

  test "should get recipes_index" do
    get recipes_url
    assert_response :success

    assert_select 'h1', 'Listing All Recipes'
  end

  test "should get recipes_new" do
    get new_recipe_url
    assert_response :success

    assert_select 'h1', 'Create New Recipe'
  end

  test "should get recipes_edit" do
    get edit_recipe_url(@recipe)
    assert_response :success

    assert_select 'h1', 'Edit This Recipe'
  end

  test "should get recipes_show" do
    get recipe_url(@recipe)
    assert_response :success
  end

end