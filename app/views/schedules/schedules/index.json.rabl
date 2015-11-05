collection @schedules
attributes :id, :name, :description, :start, :finish, :all_day, :time_zone

node(:title)   { |schedule| schedule.name                 }
node(:start)   { |schedule| schedule.start.to_s(:rfc822)  }
node(:end)     { |schedule| schedule.finish.to_s(:rfc822) }
node(:url)     { |schedule| edit_schedule_url(schedule)      }
node(:allDay)  { |schedule| schedule.all_day              }

node(:color) do |schedule|
  schedule.start - 3.days < Time.now ? '#d9534f' : '#337ab7'
end

node(:textColor)	{'#ffffff'}

node(:update) { |schedule| schedule_url(schedule) }
