require 'insteon/control'
class Device < ActiveRecord::Base
  # audited allow_mass_assignment: true
  
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

  def self.insteon_token=(token)
    Thread.current[:insteon_token] = token
  end

  def self.insteon_token
    Thread.current[:insteon_token]
  end

  def set_status
    self.status = Status.find_by(code: self.status_code).name
    self.status_icon = Status.find_by(code: self.status_code).icon
  end

  def update_controls(token)
    unless self.insteon_device_id.nil?
      case self.status_code

      when 100
        Insteon::Control.fast_on(token, self.insteon_device_id)
      when 101
        Insteon::Control.fast_off(token, self.insteon_device_id)
      end
    end
  end

end
