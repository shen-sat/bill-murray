require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:michael)
	end


	test "danger flash persists for only one request" do
		get login_path
		assert_template 'sessions/new'
		post login_path, params: { session: { email: "invalid", password: "short" } }
		assert_template 'sessions/new'
		assert flash[:danger]
		get home_path
		assert flash.empty?
	end

	test 'should login and logout user' do
		get login_path
		assert_template 'sessions/new'
		post login_path, params: { session: { email: @user.email, password: 'password' } }
		assert is_logged_in?
		follow_redirect!
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url
		follow_redirect!
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path, count: 0
		assert_select "a[href=?]", user_path(@user), count: 0
	end
end
