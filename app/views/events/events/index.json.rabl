collection @events
attributes :id, :name, :description, :start, :finish, :all_day, :time_zone

node(:title)   { |event| event.name                 }
node(:start)   { |event| event.start.to_s(:rfc822)  }
node(:end)     { |event| event.finish.to_s(:rfc822) }
node(:url)     { |event| edit_event_url(event)      }
node(:allDay)  { |event| event.all_day              }

node(:color) do |event|
  event.start - 3.days < Time.now ? '#d9534f' : '#337ab7'
end

node(:textColor)	{'#ffffff'}

node(:update) { |event| event_url(event) }
