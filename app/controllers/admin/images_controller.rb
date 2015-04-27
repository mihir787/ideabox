class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:message] = "Image succesfully created"
      redirect_to admin_images_path
    else
      flash[:errors] = @image.errors.full_messages(", ")
      render :new
    end
  end


  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:message] = "Image successfully removed"
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :avatar)
  end

end
