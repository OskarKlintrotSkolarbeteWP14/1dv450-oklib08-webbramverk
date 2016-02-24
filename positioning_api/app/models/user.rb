class User < ActiveRecord::Base
  has_many :ops

  has_secure_password

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,
            presence: {
              message: 'Username cannot be empty!'
            },
            uniqueness: {
              message: 'The username is already registrated!'
            }
  validates :email,
            presence: {
              message: 'Email cannot be empty!'
            },
            format: {
              with: VALID_EMAIL_REGEX,
              message: 'Not a valid email!'
            },
            uniqueness: {
              case_sensitive: false,
              message: 'The email is already registrated!'
            }
  validates :first_name,
            length: {
              minimum: 2,
              maximum: 20,
              message: 'First name must be between 2 and 20 charachters long'
            }
  validates :last_name,
            length: {
              minimum: 2,
              maximum: 30,
              message: 'Last name must be between 2 and 30 charachters long'
            }
  validates :password_digest,
            presence: {
              message: 'Password cannot be empty!'
            }
end
