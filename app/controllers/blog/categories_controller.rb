class Blog::CategoriesController < Blog::ApplicationController
  def show
    @category = Category.find_by_slug(params[:id])
    @posts = Post.where(category_id: @category.id, status: "published")
  end
end
