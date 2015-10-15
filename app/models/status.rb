class Status < ActiveRecord::Base

  has_many :status_options, dependent: :destroy

end
