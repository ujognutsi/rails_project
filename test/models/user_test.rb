# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(nickname: 'Example name', email: 'user@example.com', password: 'test_password',
    password_confirmation: 'test_password')
  end

  # валидность пользователя
  test 'should be valid' do
    assert @user.valid?
  end

  # непустая почта
  test 'email should be present' do
    @user.email = ' ' * 6
    assert_not @user.valid?
  end

  # валидация почты
  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # невалидные почтовые данные
  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.nickname@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # уникальность почты
  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # перевод почты в нижний регистр
  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  # непустой ник
  test 'nickname should be present' do
    @user.nickname = ' ' * 6
    assert_not @user.valid?
  end

  # не слишком длинный ник
  test 'nickname should not be too long' do
    @user.nickname = 'a' * 51
    assert_not @user.valid?
  end

  # не слишком короткий ник
  test 'nickname should not be too short' do
    @user.nickname = 'a' * 4
    assert_not @user.valid?
  end

  # уникальность ника
  test 'nickname should be unique' do
    duplicate_user = @user.dup
    duplicate_user.nickname = @user.nickname.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # непустой пароль
  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  # не слишком короткий пароль
  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  # не слишком длинный пароль
  test 'password should not be too long' do
    @user.password = @user.password_confirmation = 'a' * 101
    assert_not @user.valid?
  end
end
