class Schedule < ActiveRecord::Base
  belongs_to :property
  has_many :users, through: :property
  
  has_many :schedule_action_series, dependent: :destroy
  has_many :schedule_actions, through: :schedule_action_series
end
