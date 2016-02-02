ls
bundle install
rails server -b 0.0.0.0
exit
rails generate controller home index
rails generate model User Application
rails generate model Application
rake db:migrate
rails generate migration add_password_to_user
rake db:migrate VERSION=0
rake db:migrate
rake db:migrate VERSION=0
rake db:migrate
rake db:seed
exit
bundle install
rake db:migrate RAILS_ENV=development
rake db:seed
rails s -b 0.0.0.0
