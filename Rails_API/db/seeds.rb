# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(email: 'oskar.klintrot@gmail.com', password: '123456', password_confirmation: '123456', first_name: 'Oskar', last_name: 'Klintrot')
Key.create(user_id: u.id, application: 'figurkoder.se', api_key: '8slkhso8ihsfkliuhs98iurtopj')
Key.create(user_id: u.id, application: 'kikartan.se', api_key: 'lihwrsfg8iwhwp9gwsih9o99494')

u = User.create(email: 'erik.svensson@hotmail.com', password: '345678', password_confirmation: '345678', first_name: 'Erik', last_name: 'Svensson')
Key.create(user_id: u.id, application: 'MacKlossen', api_key: 'lijszgo87yusw4iouhwoa9jusw9')
