require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "testUser", email: "testUsertest@mail.com", password: "testUsertest")
    @recipe = Recipe.new(name: "test Recipe", description: "this is the test Recipe description!", user_id: @user.id)
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "recipe description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "recipe name should be unique" do
    @recipe.save
    recipe2 = Recipe.new(name: "test Recipe", description: "this 2 is the test Recipe description!", user_id: @user.id)
    assert_not recipe2.valid?
  end

  test "recipe name should not be too short" do
    @recipe.name = "a"
    assert_not @recipe.valid?
  end

  test "recipe name should not be too long" do
    @recipe.name = "a" * 76
    assert_not @recipe.valid?
  end

  test "recipe description should not be too short" do
    @recipe.description = "a"
    assert_not @recipe.valid?
  end

  test "recipe description should not be too long" do
    @recipe.description = "a" * 5001
    assert_not @recipe.valid?
  end

  test "recipe should have userID" do
    @recipe.user_id = ""
    assert_not @recipe.valid?
  end

end