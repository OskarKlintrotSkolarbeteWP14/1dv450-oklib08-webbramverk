u1 = ApikeyDashboard::User.create(email: 'oskar.klintrot@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin', first_name: 'Oskar', last_name: 'Klintrot', admin: true)
u2 = ApikeyDashboard::User.create(email: 'erik.svensson@hotmail.com', password: 'hemligt', password_confirmation: 'hemligt', first_name: 'Erik', last_name: 'Svensson', admin: false)
u3 = ApikeyDashboard::User.create(email: 'mia.carlsson@yahoo.se', password: 'hemligt', password_confirmation: 'hemligt', first_name: 'Mia', last_name: 'Carlsson', admin: false)
u4 = ApikeyDashboard::User.create(email: 'Lars.Holmstedt@gmail.com', password: 'hemligt', password_confirmation: 'hemligt', first_name: 'Lars', last_name: 'Holmstedt', admin: false)
u5 = ApikeyDashboard::User.create(email: 'sandra.svensson@hotmail.com', password: 'hemligt', password_confirmation: 'hemligt', first_name: 'Sandra', last_name: 'Svensson', admin: false)

ApikeyDashboard::Key.create(user_id: u1.id, application: 'Figurkoder.se', api_key: 'cf230a8f11a437bc31f2bfe1aba63f3d')
ApikeyDashboard::Key.create(user_id: u1.id, application: 'Kikartan.se', api_key: '271e5700e02f9fbc380ad88de285c92f')
ApikeyDashboard::Key.create(user_id: u2.id, application: 'MacKlossen', api_key: '90b751c209386510f8f406e9853bc149')
ApikeyDashboard::Key.create(user_id: u2.id, application: 'Fingerprint', api_key: 'ed4031f03490d7335a20b94910a8b5e6')
ApikeyDashboard::Key.create(user_id: u3.id, application: 'Arla', api_key: 'dd77b9e71c679c7566b3f3923d939d03')
ApikeyDashboard::Key.create(user_id: u3.id, application: 'Drammen', api_key: '2d96ceb7dcee2346ec8f6f6dd3d223dd')
ApikeyDashboard::Key.create(user_id: u3.id, application: 'League', api_key: '9dbc643f7988a6c3735de059386d8b23')
ApikeyDashboard::Key.create(user_id: u4.id, application: 'Kinnaman', api_key: 'b646703972a82c6f1cf42f0b784851d6')
ApikeyDashboard::Key.create(user_id: u5.id, application: 'Rubio', api_key: '9040560845d1cad79a18c8e06cddaf7f')
ApikeyDashboard::Key.create(user_id: u5.id, application: 'DumpTrump', api_key: 'b3eca8deb2e4e50ae3b635110a185328')
ApikeyDashboard::Key.create(user_id: u5.id, application: 'Alvesta', api_key: '537217b7efd9d6fd59033145f3d5e209')
ApikeyDashboard::Key.create(user_id: u4.id, application: 'Kalmar', api_key: '89ceee1ed9b0e6abd5b004ec98553acf')
ApikeyDashboard::Key.create(user_id: u2.id, application: 'Pestkusten', api_key: '6e363773a0fa1455f59d1951d8142daf')