# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {user_name: "test_user1", password: "password"},
  {user_name: "test_user2", password: "password"},
  {user_name: "test_user3", password: "password"}
])

subs = Sub.create([
  {name: "test_sub1", user_id: 1},
  {name: "test_sub1", user_id: 1}
])
