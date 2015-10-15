module ApplicationHelper

  def resource_class
	devise_mapping.to
  end

  def signin_path(provider)
    "/users/auth/#{provider.to_s}"
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user_id
    session[:user_id]
  end
  
end