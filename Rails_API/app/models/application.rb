class Application < ActiveRecord::Base
  belongs_to :user

  validates :application, presence: true,
    length: { minimum: 3, maximum: 25 },
    uniqueness: true
  validates :api_key, presence: true,
    length: { minimum: 6, maximum: 50 },
    uniqueness: true
end
