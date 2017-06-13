class Markas::PostsController < Markas::ApplicationController
  def index
    @posts = Post.all.order(date: :desc)
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
    if params[:post][:category_id]
      @category = Category.find(params[:post][:category_id])
      @post = @category.posts.build(post_params)
      @post.slug = params[:post][:title].downcase.parameterize
    else
      @post = Post.new(post_params)
    end

    if @post.save
      flash[:notice] = "Post has been created successfully."
      redirect_to markas_posts_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def update
    category = Category.find(params[:post][:category_id])
    @post = Post.find(params[:id])
    sluggish = @post.title.downcase.parameterize
    @post.slug = sluggish
    if @post.update_attributes(post_params)
      flash[:notice] = "Post has been updated successfully."
      redirect_to markas_posts_path
    else
      @categories = Category.all
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post has been deleted successfully."
    redirect_to markas_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :status, :date, :slug, :category_id)
    end
end
