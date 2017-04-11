class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    render plain: params[:post].inspect
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :status, :date)
    end
end
