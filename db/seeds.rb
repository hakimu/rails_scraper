# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.delete_all
1000.times do
  user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
  user.songs << Song.where(id: Array.new(rand(1..100)) { rand(1..1000) })
  user.save
  print '.'
end
