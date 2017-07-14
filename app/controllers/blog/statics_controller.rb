class Blog::StaticsController < Blog::ApplicationController
  def show
    if params[:id] == 'index'
      category = Category.find_by_slug('tokyo-cycling-diary')
      @posts = Post.where(category_id: category.id, status: 'published')
    end

    render params[:id]
  end

  # rescue_from ActionView::MissingTemplate do |exception|
  #   render "four-o-four", status: 404
  # end
end
