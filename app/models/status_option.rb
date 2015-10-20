class StatusOption < ActiveRecord::Base
  belongs_to :device
  belongs_to :status

  validates :device_id, presence: true
  validates :status_id, presence: true
end
