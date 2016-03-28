# Will be searchable in the API
class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ops
  before_save { self.tag = tag.capitalize }

  validates :user_id,
            presence: true
  validates :tag,
            presence: true,
            length: {
              minimum: 2,
              maximum: 20,
              message: 'The tag must be between 2 and 20 charachters!'
            },
            uniqueness: 'Tags must be unique!'
end
