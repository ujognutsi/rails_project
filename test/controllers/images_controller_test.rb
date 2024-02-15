# frozen_string_literal: true

require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  # создание новых обоев
  def setup
    @image = Image.new(name: 'Example name', description: 'exampledescription',
    wallpaper: Rack::Test::UploadedFile.new('D:\yaip_project_261223_0649\yaip_project\yaip_app\test\fixtures\files\eCvx1fFcbrw.jpg', 'image/jpg'), id: 1)
  end

  # адресация на страницу создания обоев
  test 'should get new' do
    get '/images/new'
    assert_response :success
  end

  # адресация на страницу изменения обоев
  test 'should get edit' do
    get edit_image_url(@image)
    assert_response :missing
  end

  # адресация на страницу галереи
  test 'should get gallery' do
    get '/gallery'
    assert_response :success
  end

  # адресация на страницу просмотра обоев
  test 'should get show' do
    get image_url(@image)
    assert_response :missing
  end
end
