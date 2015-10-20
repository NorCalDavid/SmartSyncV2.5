class Room < ActiveRecord::Base
  belongs_to :property
  has_many :devices

  validates :name, :presence => true
  validates :location, :presence => true
end
