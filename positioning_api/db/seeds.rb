# This file should contain all the record creation
# needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed
# or created alongside the db with db:setup.
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ApikeyDashboard::Engine.load_seed

u1 = User.create(username: 'Krakan', email: 'krakan@katt.nu',
                 first_name: 'Krakan', last_name: 'Katt',
                 password: 'hemligt', password_confirmation: 'hemligt')

u2 = User.create(username: 'Skatan', email: 'skatan@katt.nu',
                 first_name: 'Skatan', last_name: 'Katt',
                 password: 'hemligt', password_confirmation: 'hemligt')

u3 = User.create(username: 'Tiger', email: 'tiger@katt.nu',
                 first_name: 'Tiger', last_name: 'Katt',
                 password: 'hemligt', password_confirmation: 'hemligt')

u4 = User.create(username: 'Carro', email: 'carro@far.se',
                 first_name: 'Carro', last_name: 'Får',
                 password: 'hemligt', password_confirmation: 'hemligt')

u5 = User.create(username: 'Baggen', email: 'baggen@far.se',
                 first_name: 'Krakan', last_name: 'Får',
                 password: 'hemligt', password_confirmation: 'hemligt')

p1 = Position.create(lng: '57.002757', lat: '14.573297', place: 'Moheda',
                     region: 'Kronobergs län', country: 'Sweden')

p2 = Position.create(lng: '56.879004', lat: '14.805852', place: 'Växjö',
                     region: 'Kronobergs län', country: 'Sweden')

p3 = Position.create(lng: '56.663445', lat: '16.356779', place: 'Kalmar',
                     region: 'Kalmar län', country: 'Sweden')

t1 = Tag.create(tag: 'Kyrka')
t2 = Tag.create(tag: 'Skola')
t3 = Tag.create(tag: 'Runsten')
t4 = Tag.create(tag: 'Sjö')
t5 = Tag.create(tag: 'Tåg')
t6 = Tag.create(tag: 'Parkbänk')

o1 = Op.create(position_id: p1.id, user_id: u1.id, item: 'Ett test')

o2 = Op.create(position_id: p2.id, user_id: u2.id, item: 'Ett annat test')

o3 = Op.create(position_id: p3.id, user_id: u3.id, item: 'Ett till test')

o4 = Op.create(position_id: p1.id, user_id: u4.id, item: 'Ännu ett test')

o5 = Op.create(position_id: p2.id, user_id: u5.id, item: 'Nästan sista testet')

o6 = Op.create(position_id: p3.id, user_id: u1.id, item: 'Ett sista test')

o1.tags << t1
o1.tags << t2
o2.tags << t3
o3.tags << t4
o3.tags << t5
o4.tags << t6
o4.tags << t1
o4.tags << t2
o5.tags << t3
o6.tags << t4
