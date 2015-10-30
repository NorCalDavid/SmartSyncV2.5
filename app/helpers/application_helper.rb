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

  def current_user_id
    current_user.id
  end

  def insteon_connected?
    current_user.valid_insteon_token?
  end

  def find_user(user_id)
    User.find(user_id)
  end
  
end