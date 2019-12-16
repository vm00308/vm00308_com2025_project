require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Dinner")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "category name should be unique" do
    @category.save
    category2 = Category.new(name: "Dinner")
    assert_not category2.valid?
  end

  test "category name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

  test "category name should not be too long" do
    @category.name = "a" * 31
    assert_not @category.valid?
  end

end