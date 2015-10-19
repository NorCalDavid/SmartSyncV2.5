class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  # # GET /users/:id/profile
  def profile
  end
  
  private
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
