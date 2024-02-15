require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  # регистрация с невалидными данными
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: { nickname: '',
                               email: 'user@invalid',
                               password: 'foo',
                               password_confirmation: 'bar' }}
    end
    assert_template 'users/new'
  end

  # регистрация с валидными данными
  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { nickname: 'Example User',
                                            email: 'user@example.com',
                                            password: 'password',
                                            password_confirmation: 'password' }
    }
    follow_redirect!
    end
    assert_template 'images/gallery/'
    assert is_logged_in?
  end
end
