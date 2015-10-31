require 'insteon/account'

class Insteon::AccountController < Insteon::BaseController
	before_action :authenticate_user!
	
  # GET /insteon/accounts/
  def index
    accounts = Insteon::Account.get_accounts(@token)
    @insteon_accounts = accounts["AccountList"]
  end

end


 