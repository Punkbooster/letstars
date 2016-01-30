# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!([

	{ email: 'admin@gmail.com', password: '1234test', password_confirmation: '1234test', role: 'administrator' },

	{ email: 'client@gmail.com', password: '1234test', password_confirmation: '1234test', role: '' }

	])

p "Created #{User.count} users"