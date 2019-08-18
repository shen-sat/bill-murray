require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "danger flash persists for only one request" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "invalid", password: "short" } }
    assert_template 'sessions/new'
    assert flash[:danger]
    get home_path
    assert flash.empty?
  end
end
