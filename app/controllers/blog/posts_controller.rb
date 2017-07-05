class Blog::PostsController < Blog::ApplicationController
  def show
    @post = Post.find_by slug: params[:id], status: "published"
    if !@post
      render "blog/statics/four-o-four", status: 404
    end
  end
end
