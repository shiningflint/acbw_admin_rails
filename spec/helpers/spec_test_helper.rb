module SpecTestHelper
  def login(user)
    user = User.find_by_name(user.to_s) if user.is_a?(Symbol)
    request.session[:user_id] = user.id
  end
end
