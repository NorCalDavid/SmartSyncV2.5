class Users::RegistrationsController < Devise::RegistrationsController
before_action :authenticate_user!
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]
before_action :set_user, only: [:cancel_account]

  #GET /resource/sign_up
  def new
    super
  end

  #POST /resource
  def create
    super
  end

  #GET /resource/edit
  def edit
    super
  end

  #PUT /resource
  def update
    super
  end

  #DELETE /resource
  def destroy
    super
  end

  #GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  def cancel_account
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    accessible = [ :firstname, :lastname, :name, :image ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    devise_parameter_sanitizer.for(:sign_up) << accessible
  end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    accessible = [ :firstname, :lastname, :name, :image ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    devise_parameter_sanitizer.for(:account_update) << accessible
  end

  #The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  #The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    p session
    accessible = [ :firstname, :lastname, :name, :email, :image ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

end
