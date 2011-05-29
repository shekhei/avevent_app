# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Zhou Zhiwei"
  user.email                 "zhizhou@aviva-asia.com"
  user.department            "HR"
end

Factory.define :event do |event|
  event.name                 "Aviva Lunchtime Happy Hour"
  event.peak                 "Social"
  event.start_time           "2011-05-27 12:00:00.000000"
  event.end_time             "2011-05-27 14:00:00.000000"
end