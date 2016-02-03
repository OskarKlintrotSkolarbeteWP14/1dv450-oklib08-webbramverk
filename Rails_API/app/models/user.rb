class User < ActiveRecord::Base
  has_many :applications

  validates :username, presence: true,
    length: { minimum: 3, maximum: 20 },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
    length: { minimum: 6, maximum: 50 },
    confirmation: true
  validates :first_name, length: { minimum: 2, maximum: 20 }
  validates :last_name, length: { minimum: 2, maximum: 30 }

  has_secure_password
end
