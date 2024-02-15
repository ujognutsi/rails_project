require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # адресация на страницу регистрации
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  # регистрация пользователя
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { nickname: 'JohnDoe', email: 'john.doe@example.com', password: 'password', password_confirmation: 'password' } }
    end

    assert_redirected_to user_url(User.last)
  end

  # запрет на показ страницы пользователя
  test "should show user" do
    get user_url(@user)
    assert_response(406)
  end

  # адресация на страницу авторизации
  test "should get login" do
    get login_url
    assert_response :success
  end
end