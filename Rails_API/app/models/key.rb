class Key < ActiveRecord::Base
  belongs_to :user

  validates :application, presence: { message: "Applikationen måste ha ett namn!" },
    length: { minimum: 3, maximum: 25, message: "Applikationen måste ha ett namn på mellan 3 och 25 tecken." },
    uniqueness: { message: "Applikationen finns redan!" }
  validates :api_key, presence: true,
    length: { minimum: 6, maximum: 50 },
    uniqueness: true
end
