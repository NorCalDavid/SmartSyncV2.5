class ScheduleActionSeries < ActiveRecord::Base
  belongs_to :schedule_actions
  belongs_to :schedule, through: :schedule_actions
  belongs_to :user, through: :schedule, source: :schedule_actions
end
