class ScheduleActionSeries < ActiveRecord::Base
  belongs_to :schedule
  has_many :schedule_actions, dependent: :destroy
end
