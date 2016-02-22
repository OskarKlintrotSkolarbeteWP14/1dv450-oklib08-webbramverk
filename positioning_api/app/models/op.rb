# A photo opportunity
class Op < ActiveRecord::Base
  belongs_to :creator
  belongs_to :position
  has_and_belongs_to_many :tag

  validates :item,
            presence: true
end
