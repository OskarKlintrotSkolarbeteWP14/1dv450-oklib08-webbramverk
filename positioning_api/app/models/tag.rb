# Will be searchable in the API
class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ops

  validates :name,
            presence: true,
            length: {
              minimum: 2,
              maximum: 20,
              message: 'The tag must be between 2 and 20 charachters!'
            },
            uniqueness: true
end
