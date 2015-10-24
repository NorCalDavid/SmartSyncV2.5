class Users::SessionsController < Devise::SessionsController
before_action :authenticate_user!
before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
    session.destroy
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) <<  [:email, :password, :password_confirmation ]
  end
end
