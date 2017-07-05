class Blog::StaticsController < Blog::ApplicationController
  def show
    render params[:id]
  end

  rescue_from ActionView::MissingTemplate do |exception|
    render "four-o-four", status: 404
  end
end
