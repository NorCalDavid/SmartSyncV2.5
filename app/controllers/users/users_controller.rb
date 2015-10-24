class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  # # GET /users/:id/profile
  def profile
  end
  
  # # GET /users/:id/github
  def github
    @github = current_user.github

    if @github.nil?
      flash[:alert] = "You have not linked your Github Account."
    end
  end

  # # GET /users/:id/twitter
  def twitter
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
