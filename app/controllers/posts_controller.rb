class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
    # render plain: params[:post].inspect
  end

  def edit
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :status, :date)
    end
end
