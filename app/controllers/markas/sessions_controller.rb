class Markas::SessionsController < Markas::ApplicationController
  skip_before_action :authorize_admin!
  
  def new
  end

  def create
    user = User.find_by_name(params[:session][:user])
    if user && user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to markas_posts_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to markas_login_path
  end
end
