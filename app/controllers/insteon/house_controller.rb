require 'insteon/house'

class Insteon::HouseController < Insteon::BaseController
	before_action :authenticate_user!
		
  # GET /insteon/houses/
  def index
    houses = Insteon::House.get_houses(@token)
    @insteon_houses = houses["HouseList"]
  end

end


 