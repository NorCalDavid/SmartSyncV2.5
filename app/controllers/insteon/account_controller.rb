require 'insteon/account'

class Insteon::AccountController < Insteon::BaseController
	
  # GET /insteon/accounts/
  def index
    accounts = Insteon::Account.get_accounts(@token)
    @insteon_accounts = accounts["AccountList"]
  end

end


 