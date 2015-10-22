class Room < ActiveRecord::Base
  audited allow_mass_assignment: true
  
  belongs_to :property
  has_many :devices

  validates :name, :presence => true
  validates :location, :presence => true
  
end
