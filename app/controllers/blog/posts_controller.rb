class Blog::PostsController < Blog::ApplicationController
  def show
    @post = Post.find_by slug: params[:id], status: "published"
    if !@post
      render plain: "404 Not Found", status: 404
    end
  end
end
