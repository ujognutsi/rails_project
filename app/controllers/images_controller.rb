class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to @image
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to(images_path, allow_other_host: true, status: :see_other)
  end

  def gallery
    @image = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def temp
    @result = params[:rating_g]
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :wallpaper)
  end
end
