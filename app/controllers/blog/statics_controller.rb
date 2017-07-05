class Blog::StaticsController < Blog::ApplicationController
  def show
    render params[:id]
  end

  rescue_from ActionView::MissingTemplate do |exception|
    render plain: "404 Not Found", status: 404
  end
end
