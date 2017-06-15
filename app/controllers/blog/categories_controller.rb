class Blog::CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug(params[:id])
    @posts = Post.where(category_id: @category.id);
  end
end
