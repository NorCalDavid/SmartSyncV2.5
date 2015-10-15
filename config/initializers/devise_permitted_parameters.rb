module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname, :name, :email, :password, :password_confirmation] 
    devise_parameter_sanitizer.for(:account_update) << [:firstname, :lastname, :name, :email, :password, :password_confirmation] 
  end

end

DeviseController.send :include, DevisePermittedParameters
