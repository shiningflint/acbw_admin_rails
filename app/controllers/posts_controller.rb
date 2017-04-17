class PostsController < ApplicationController
	before_action :authorize

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to posts_path
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :status, :date)
		end
end
