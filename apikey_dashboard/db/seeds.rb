u1 = ApikeyDashboard::User.create(email: 'oskar.klintrot@gmail.com',
                                  password: 'adminadmin',
                                  password_confirmation: 'adminadmin',
                                  first_name: 'Oskar',
                                  last_name: 'Klintrot',
                                  admin: true)
u2 = ApikeyDashboard::User.create(email: 'erik.svensson@hotmail.com',
                                  password: 'hemligt',
                                  password_confirmation: 'hemligt',
                                  first_name: 'Erik',
                                  last_name: 'Svensson',
                                  admin: false)
u3 = ApikeyDashboard::User.create(email: 'mia.carlsson@yahoo.se',
                                  password: 'hemligt',
                                  password_confirmation: 'hemligt',
                                  first_name: 'Mia',
                                  last_name: 'Carlsson',
                                  admin: false)
u4 = ApikeyDashboard::User.create(email: 'Lars.Holmstedt@gmail.com',
                                  password: 'hemligt',
                                  password_confirmation: 'hemligt',
                                  first_name: 'Lars',
                                  last_name: 'Holmstedt',
                                  admin: false)
u5 = ApikeyDashboard::User.create(email: 'sandra.svensson@hotmail.com',
                                  password: 'hemligt',
                                  password_confirmation: 'hemligt',
                                  first_name: 'Sandra',
                                  last_name: 'Svensson',
                                  admin: false)

ApikeyDashboard::Key.create(user_id: u1.id,
                            application: 'Figurkoder.se',
                            api_key: '4596a2c301f468c24447e67ab0035523')
ApikeyDashboard::Key.create(user_id: u1.id,
                            application: 'Kikartan.se')
ApikeyDashboard::Key.create(user_id: u2.id,
                            application: 'MacKlossen')
ApikeyDashboard::Key.create(user_id: u2.id,
                            application: 'Fingerprint')
ApikeyDashboard::Key.create(user_id: u3.id,
                            application: 'Arla')
ApikeyDashboard::Key.create(user_id: u3.id,
                            application: 'Drammen')
ApikeyDashboard::Key.create(user_id: u3.id,
                            application: 'League')
ApikeyDashboard::Key.create(user_id: u4.id,
                            application: 'Kinnaman')
ApikeyDashboard::Key.create(user_id: u5.id,
                            application: 'Rubio')
ApikeyDashboard::Key.create(user_id: u5.id,
                            application: 'DumpTrump')
ApikeyDashboard::Key.create(user_id: u5.id,
                            application: 'Alvesta')
ApikeyDashboard::Key.create(user_id: u4.id,
                            application: 'Kalmar')
ApikeyDashboard::Key.create(user_id: u2.id,
                            application: 'Pestkusten')
