# A photo opportunity
class Op < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  has_and_belongs_to_many :tags

  validates :item,
            presence: true
end
