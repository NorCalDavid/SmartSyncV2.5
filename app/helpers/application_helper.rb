module ApplicationHelper

  def resource_class
	devise_mapping.to
  end

  def signin_path(provider)
    "/users/auth/#{provider.to_s}"
  end
  
end