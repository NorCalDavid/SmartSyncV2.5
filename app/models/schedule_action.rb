class ScheduleAction < ActiveRecord::Base
  belongs_to :schedule
  # belongs_to :user, through: :schedule
end
