class ScheduleAction < ActiveRecord::Base
  belongs_to :schedule
  has_many :schedule_action_series
  has_one :user, through: :schedule
end
