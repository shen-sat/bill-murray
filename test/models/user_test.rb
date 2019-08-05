require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "should have name present" do
  	@user.name = " "
  	assert_not @user.valid?
  end

  test "should have email present" do
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 255 + "@example.com"
    assert_not @user.valid? 
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid? 
  end

  test "should accept valid email addresses" do
    valid_emails = %w[example@example.com EXAMPLE@example.com exa_mple@example.com example@foo.jp]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "This email: #{email.inspect} should be valid"
    end 
  end

  test "should accept invalid email addresses" do
    valid_emails = %w[example.com EXAMPLE_at_example.com exa_mple@example. example@foo+jp]
    valid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "This email: #{email.inspect} should be invalid"
    end 
  end






end
