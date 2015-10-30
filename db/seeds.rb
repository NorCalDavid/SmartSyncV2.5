# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
AdminUser.create!(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'])

# Create Standard Status Options
Status.create({code: 0, name: "No Status", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/0.png"})
Status.create({code: 999, name: "Configure Device", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/999.png"})
Status.create({code: 500, name: "Ok", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/500.png"})
Status.create({code: 501, name: "Unknown", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/501.png"})
Status.create({code: 502, name: "Error", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/502.png"})

# Lighting Dim Values 1 to 99
for i in 1..99 do
  Status.create({code: i, name: "Dim - #{i}%", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/#{i.round(-1)}.png" })
end

# Lighting Value 100 = On & 101 = Off

Status.create({code: 100, name: "On", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/100.png"})
Status.create({code: 101, name: "Off", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/101.png"})

# Climate Control Values

Status.create({code: 600, name: "Cool", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/600.png"})
Status.create({code: 601, name: "Heat", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/601.png"})
Status.create({code: 602, name: "Auto", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/602.png"})
Status.create({code: 605, name: "Ok", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/605.png"})
Status.create({code: 610, name: "Fan On", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/610.png"})
Status.create({code: 611, name: "Fan Off", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/611.png"})
Status.create({code: 612, name: "Fan Auto", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/612.png"})

for i in 0..110 do
  Status.create({code: i, name: "#{i}ºF", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/#{(1600 + i).round(-1)}.png" })
end

# Security Values

Status.create({code: 700, name: "Closed/Secure", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/700.png"})
Status.create({code: 701, name: "Closed/No Motion", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/701.png"})
Status.create({code: 702, name: "Open", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/702.png"})
Status.create({code: 703, name: "Open/Motion", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/703.png"})
Status.create({code: 704, name: "Window Closed", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/704.png"})
Status.create({code: 705, name: "Window Open", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/705.png"})
Status.create({code: 706, name: "Glass Breakage", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/706.png"})

Status.create({code: 900, name: "No Motion", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/900.png"})
Status.create({code: 901, name: "Motion", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/901.png"})

Status.create({code: 1000, name: "Armed/Stay", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1000.png"})
Status.create({code: 1000, name: "Armed Away", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1000.png"})
Status.create({code: 1000, name: "Valid Code", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1000.png"})

Status.create({code: 1001, name: "Alarm/Stay", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1001.png"})
Status.create({code: 1001, name: "Alarm/Away", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1001.png"})
Status.create({code: 1001, name: "Invalid Code", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1001.png"})

Status.create({code: 1002, name: "Fault/Stay", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1002.png"})
Status.create({code: 1002, name: "Fault/Away", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1002.png"})
Status.create({code: 1002, name: "Panic Code", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1002.png"})

Status.create({code: 1003, name: "Locked", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1003.png"})
Status.create({code: 1013, name: "Unlocked", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1013.png"})

Status.create({code: 1004, name: "Lock Automatically", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1004.png"})
Status.create({code: 1014, name: "Unlocked with Code", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1014.png"})

Status.create({code: 1005, name: "Locked Manually", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1005.png"})
Status.create({code: 1015, name: "Unlocked Manually", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1015.png"})

Status.create({code: 1006, name: "Locked by Z-Wave", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1006.png"})
Status.create({code: 1016, name: "Unlocked by Z-Wave", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/1016.png"})

# Garage Door Values

Status.create({code: 750, name: "Closed", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/750.png"})
Status.create({code: 751, name: "Open", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/751.png"})
Status.create({code: 752, name: "Moving", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/752.png"})
Status.create({code: 753, name: "Opening", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/753.png"})
Status.create({code: 754, name: "Closing", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/754.png"})
Status.create({code: 755, name: "Error", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/755.png"})
Status.create({code: 756, name: "Unknown", icon: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444386550/Status-Icons/756.png"})

# Create Standard Command Options


Command.create({  name: "Insteon-On", 
									description: "Turns device on to Specified Level (Default Level is 100)", 
									command_type: "Insteon", 
									action: "", 
									action_type: "POST",
									values: "{\n    \"command\": \"on\",\n    \"level\": 50,\n    \"device_id\": 42\n}",
									headers: "{:content_type => \"application/json\",:authentication => \"#{ENV["INSTEON_KEY"]}\",:authorization => \"\"}",
									route: "/api/v2/commands"  })


