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

c1 = Creator.create(username: 'Krakan', email: 'krakan@katt.nu',
                    first_name: 'Krakan', last_name: 'Katt',
                    password: 'hemligt', password_confirmation: 'hemligt')

c2 = Creator.create(username: 'Skatan', email: 'skatan@katt.nu',
                    first_name: 'Skatan', last_name: 'Katt',
                    password: 'hemligt', password_confirmation: 'hemligt')

c3 = Creator.create(username: 'Tiger', email: 'tiger@katt.nu',
                    first_name: 'Tiger', last_name: 'Katt',
                    password: 'hemligt', password_confirmation: 'hemligt')

c4 = Creator.create(username: 'Carro', email: 'carro@far.se',
                    first_name: 'Carro', last_name: 'Får',
                    password: 'hemligt', password_confirmation: 'hemligt')

c5 = Creator.create(username: 'Baggen', email: 'baggen@far.se',
                    first_name: 'Krakan', last_name: 'Får',
                    password: 'hemligt', password_confirmation: 'hemligt')

p1 = Position.create(lng: '57.002757', lat: '14.573297', place: 'Moheda',
                     region: 'Kronobergs län', country: 'Sweden')

p2 = Position.create(lng: '56.879004', lat: '14.805852', place: 'Växjö',
                     region: 'Kronobergs län', country: 'Sweden')

p3 = Position.create(lng: '56.663445', lat: '16.356779', place: 'Kalmar',
                     region: 'Kalmar län', country: 'Sweden')

t1 = Tag.create(name: 'Kyrka')
t2 = Tag.create(name: 'Skola')
t3 = Tag.create(name: 'Runsten')
t4 = Tag.create(name: 'Sjö')
t5 = Tag.create(name: 'Tåg')
t6 = Tag.create(name: 'Parkbänk')

Op.create(position_id: p1.id, tag_id: t1.id,
          creator_id: c1.id, item: 'Ett test')

Op.create(position_id: p2.id, tag_id: t2.id,
          creator_id: c2.id, item: 'Ett test')

Op.create(position_id: p3.id, tag_id: t3.id,
          creator_id: c3.id, item: 'Ett test')

Op.create(position_id: p1.id, tag_id: t4.id,
          creator_id: c4.id, item: 'Ett test')

Op.create(position_id: p2.id, tag_id: t5.id,
          creator_id: c5.id, item: 'Ett test')

Op.create(position_id: p3.id, tag_id: t6.id,
          creator_id: c1.id, item: 'Ett test')
