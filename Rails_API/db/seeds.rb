# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(username: 'Oskar', password: '123456')
Application.create(user_id: u.id, application: 'Test app', api_key: '8slkhso8ihsfkliuhs98iurtopj')
