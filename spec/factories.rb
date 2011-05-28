# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Zhou Zhiwei"
  user.email                 "zhizhou@aviva-asia.com"
  user.department            "HR"
end