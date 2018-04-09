require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(firstname: "Example", lastname: "Example", email: "user@example.com",
    password: "foobaraa", password_confirmation: "foobaraa")
  end

  test "should be valid" do
    assert @user.valid?
  end

   test "first name should be present" do
     @user.firstname = "      "
     assert_not @user.valid?
  end

  test "last name should be present" do
    @user.lastname = "      "
    assert_not @user.valid?
 end
  test "email should be present" do
    @user.email = "       "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
   end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end

  test "password should have a minimum length of 8 characters" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

end
