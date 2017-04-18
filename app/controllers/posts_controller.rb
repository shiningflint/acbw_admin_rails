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
		@category = Category.find(params[:post][:category_id])
		@post = @category.posts.create(post_params)
		@post.save
		redirect_to posts_path
	end

	def update
		category = Category.find(params[:post][:category_id])
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		# @post.update(post_params)
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :status, :date, :category_id)
		end
end
