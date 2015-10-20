class Device < ActiveRecord::Base
  audited allow_mass_assignment: true
  
  belongs_to :room
  has_one :property, through: :room
  has_many :user_devices, dependent: :destroy
  has_many :users, through: :user_devices
  has_many :status_options, dependent: :destroy
  
  has_many :device_commands, dependent: :destroy
  has_many :commands, through: :device_commands

  before_save :set_status
  before_create :set_status

  validates :name, presence: true
  validates :location, presence: true

  def set_status
    self.status = Status.find_by(code: self.status_code).name
    self.status_icon = Status.find_by(code: self.status_code).icon
  end

end
