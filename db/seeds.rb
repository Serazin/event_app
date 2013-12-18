# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
event_list = [
  [ "New year", 15.day.from_now, "yearly", "Happy New Year!" ],
  [ "Theater", 1.month.ago, " ", "Boris Godunov" ],
  [ "Dentist", 34.day.from_now, " ", "Poor me" ],
  [ "Gym", 2.day.from_now, "weekly", "Muscle!" ],
  [ "Store", 1.day.from_now, "daily", "something to eat"],
  [ "Job", 3.day.from_now, "daily", "At last!" ],
  [ "Study", 1.day.ago, "daily", "Knowledge" ],
  [ "Friends", 2.day.ago, "monthly", "Don't get to drunk!" ],
  [ "Vacation", 6.month.from_now, "yearly", "Yay!" ],
  [ "BD", 10.month.from_now, "yearly", "Happy BD!" ]
]

event_list.each do |event_title, scheduled_at, recurrence, description|
  Event.create( event_title: event_title, scheduled_at: scheduled_at, recurrence: recurrence, description: description )
end

Event.create( event_title: 'BD', scheduled_at: 1.month.ago, recurrence: 'yearly', description: 'Happy BD!' )
