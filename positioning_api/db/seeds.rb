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

p1 = Position.create(lat: '57.002757', lng: '14.573297',
                     place: 'Moheda', region: 'Kronobergs län',
                     country: 'Sweden', user_id: u1.id)

p2 = Position.create(lat: '57.022255', lng: '14.523243',
                     place: 'Moheda', region: 'Kronobergs län',
                     country: 'Sweden', user_id: u1.id)

p3 = Position.create(lat: '56.879004', lng: '14.805852',
                     place: 'Växjö', region: 'Kronobergs län',
                     country: 'Sweden', user_id: u1.id)

p4 = Position.create(lat: '56.829109', lng: '14.825255',
                     place: 'Växjö', region: 'Kronobergs län',
                     country: 'Sweden', user_id: u1.id)

p5 = Position.create(lat: '56.663445', lng: '16.356779',
                     place: 'Kalmar', region: 'Kalmar län',
                     country: 'Sweden', user_id: u2.id)

p6 = Position.create(lat: '56.623431', lng: '16.326712',
                     place: 'Kalmar', region: 'Kalmar län',
                     country: 'Sweden', user_id: u2.id)

t1 = Tag.create(tag: 'Kyrka', user_id: u1.id)
t2 = Tag.create(tag: 'Skola', user_id: u3.id)
t3 = Tag.create(tag: 'Runsten', user_id: u5.id)
t4 = Tag.create(tag: 'Sjö', user_id: u2.id)
t5 = Tag.create(tag: 'Tåg', user_id: u4.id)
t6 = Tag.create(tag: 'Parkbänk', user_id: u1.id)

o1 = Op.create(position_id: p1.id,
               user_id: u1.id,
               item: 'Ett test',
               note: 'En kyrka vid en skola')

o2 = Op.create(position_id: p2.id,
               user_id: u2.id,
               item: 'Ett annat test',
               note: 'En runsten')

o3 = Op.create(position_id: p3.id,
               user_id: u3.id,
               item: 'Ett till test',
               note: 'Ett tåg i sjön')

o4 = Op.create(position_id: p4.id,
               user_id: u4.id,
               item: 'Ännu ett test',
               note: 'En parkbänk vid en kyrka vid en
               skola - Per Gessle hälsar!')

o5 = Op.create(position_id: p5.id,
               user_id: u5.id,
               item: 'Nästan sista testet',
               note: 'En till runsten!')

o6 = Op.create(position_id: p6.id,
               user_id: u1.id,
               item: 'Ett sista test',
               note: 'En plaskdam')

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
