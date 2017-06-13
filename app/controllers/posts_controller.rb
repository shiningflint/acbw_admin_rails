class PostsController < ApplicationController
  # sort posts by category
  def catsort
    @posts = Post.where(category_id: params[:category_id]);
    render "index"
  end
end
