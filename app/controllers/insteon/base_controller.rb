class Insteon::BaseController < ApplicationController
	before_action :authenticate_user!
  before_action :set_token



  private

  def set_token
    @token = current_user.insteon_token
  end

end