class Device < ActiveRecord::Base

  belongs_to :room
  belongs_to :property
  has_one :user, through: :property
  has_many :status_options, dependent: :destroy
  has_many :device_commands, dependent: :destroy

  before_save :set_status
  before_create :set_status

  def set_status
    self.status = Status.find_by(code: self.status_code).name
    self.status_icon = Status.find_by(code: self.status_code).icon
  end

end
