class User < ActiveRecord::Base
  has_many :applications

  validates :username, presence: { message: "Du måste ange ett användarnamn!" },
    length: { minimum: 3, maximum: 20, message: "Användarnamnet måste vara minst 3 tecken och max 20 tecken." },
    uniqueness: { case_sensitive: false, message: "Användarnamnet är upptaget." }
  validates :password, presence: { message: "Du måste ange ett lösenord!" },
    length: { minimum: 6, message: "Lösenordet måste vara minst 6 tecken." },
    confirmation: true
  validates :first_name, length: { minimum: 2, maximum: 20, message: "Förnamnet måste vara minst 2 tecken och max 20 tecken." }
  validates :last_name, length: { minimum: 2, maximum: 30, message: "Efternamnet måste vara minst 2 tecken och max 20 tecken." }

  has_secure_password
end
