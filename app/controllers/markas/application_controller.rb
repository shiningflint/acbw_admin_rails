class Markas::ApplicationController < ApplicationController
  layout "markas"
  protect_from_forgery with: :exception
  before_action :authorize_admin!

  def index
    redirect_to markas_posts_path
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize_admin!
      redirect_to new_session_path unless current_user
    end
end
