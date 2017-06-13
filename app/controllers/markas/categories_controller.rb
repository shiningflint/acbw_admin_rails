class Markas::CategoriesController < Markas::ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to markas_categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(cat_params)
      flash[:notice] = "Category updated successfully."
      redirect_to markas_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Category deleted successfully."
      redirect_to markas_categories_path
    else
      render 'edit'
    end
  end

  private
    def cat_params
      params.require(:category).permit(:category_name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
