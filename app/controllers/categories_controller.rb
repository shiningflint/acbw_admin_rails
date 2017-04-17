class CategoriesController < ApplicationController
	before_action :authorize
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(cat_params)

		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	private
		def cat_params
			params.require(:category).permit(:category_name)
		end
end
