require 'insteon/house'

class Insteon::HouseController < Insteon::BaseController
	
  # GET /insteon/houses/
  def index
    houses = Insteon::House.get_houses(@token)
    @insteon_houses = houses["HouseList"]
  end

end


 