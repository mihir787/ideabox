class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = "New category has been created"
      redirect_to admin_categories_path
    else
      flash[:errors] = @category.errors.full_messages(", ")
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:message] = "Successfully updated category"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:message] = "Successfully deleted category"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
