class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :schedule_actions, dependent: :destroy
  has_many :schedule_action_series, dependent: :destroy
end
