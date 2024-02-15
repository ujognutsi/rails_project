require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    @image = Image.new(name: 'Example name', description: 'exampledescription',
    wallpaper: Rack::Test::UploadedFile.new('D:\yaip_project_261223_0649\yaip_project\yaip_app\test\fixtures\files\eCvx1fFcbrw.jpg', 'image/jpg'))
  end

  # валидность картинки
  test 'should be valid' do
    assert @image.valid?
  end
end
