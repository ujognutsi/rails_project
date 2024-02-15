require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  # адресация на приветственную страницу
  test 'should get welcome' do
    get '/'
    assert_response :success
  end
end
