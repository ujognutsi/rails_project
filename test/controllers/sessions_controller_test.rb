require 'test_helper'
class SessionsControllerTest < ActionController::TestCase
  # адресация на страницу авторизации
  test 'should get new' do
    get '/login'
    assert_response :success
  end

  # создание сессии
  test 'should create session for user' do
    post '/login', params: { session: { email: users(:one).email, password: 'password' } }
    assert_response :success
  end
end