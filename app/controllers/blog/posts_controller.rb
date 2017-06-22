class Blog::PostsController < Blog::ApplicationController
  def show
    @post = Post.find_by_slug(params[:id])
  end
end
