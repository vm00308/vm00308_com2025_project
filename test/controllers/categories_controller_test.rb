require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @category = Category.create(name: "Dinner")
  end

  test "should get categories_index" do
    get categories_url
    assert_response :success

    assert_select 'h1', 'Listing All Categories'
  end

  test "should get categories_new" do
    get new_category_url
    assert_response :success

    assert_select 'h1', 'Create New Category'
  end

  test "should get categories_edit" do
    get edit_category_url(@category)
    assert_response :success

    assert_select 'h1', 'Edit This Category'
  end

  test "should get categories_show" do
    get category_url(@category)
    assert_response :success
  end

end