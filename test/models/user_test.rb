require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "testUser", email: "testUsertest@mail.com", password: "testUsertest")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be unique" do
    @user.save
    user2 = User.new(username: "testUser", email: "testUsertest2@mail.com", password: "testUsertest")
    assert_not user2.valid?
  end

  test "email should be unique" do
    @user.save
    user2 = User.new(username: "testUser2", email: "testUsertest@mail.com", password: "testUsertest")
    assert_not user2.valid?
  end

  test "username should not be too short" do
    @user.username = "a"
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 31
    assert_not @user.valid?
  end

end