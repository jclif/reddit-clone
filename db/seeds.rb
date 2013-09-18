# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO find best way to accomplish: rake db:drop && rake db:create && rake db:migrate && rake db:seed (alias?)

users = User.create([
  {user_name: "test_user1", password: "password"},
  {user_name: "test_user2", password: "password"},
  {user_name: "test_user3", password: "password"}
])

subs = Sub.create([
  {name: "test_sub1", user_id: 1},
  {name: "test_sub1", user_id: 1}
])

links = Link.create([
  {title: "Post", url: "cats.com", body: "", user_id: 1},
  {title: "Repost", url: "dogs.com", body: "test_body", user_id: 1}
])

linksubs = LinkSub.create([
  {link_id: 1, sub_id: 1},
  {link_id: 2, sub_id: 1},

  {link_id: 2, sub_id: 2}
])
