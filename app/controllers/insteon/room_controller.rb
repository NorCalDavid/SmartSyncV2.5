require 'insteon/room'

class Insteon::RoomController < Insteon::BaseController
	before_action :authenticate_user!
		
  # GET /insteon/rooms/
  def index
    rooms = Insteon::Room.get_rooms(@token)
    @insteon_rooms = rooms["RoomList"]
    ap @insteon_rooms
  end

end


 