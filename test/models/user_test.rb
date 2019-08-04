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


end
