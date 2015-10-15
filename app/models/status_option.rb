class StatusOption < ActiveRecord::Base

  belongs_to :device
  belongs_to :status

end
