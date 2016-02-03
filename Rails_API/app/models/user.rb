class User < ActiveRecord::Base
  has_many :applications

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: { message: "Du måste ange en e-post!" },
    length: { maximum: 255, message: "E-postadressen får vara max 255 tecken." },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false, message: "E-postadressen är redan registrerad." }
  validates :password, presence: { message: "Du måste ange ett lösenord!" },
    length: { minimum: 6, message: "Lösenordet måste vara minst 6 tecken." },
    confirmation: true
  validates :first_name, length: { minimum: 2, maximum: 20, message: "Förnamnet måste vara minst 2 tecken och max 20 tecken." }
  validates :last_name, length: { minimum: 2, maximum: 30, message: "Efternamnet måste vara minst 2 tecken och max 20 tecken." }

  has_secure_password
end
