# Stores a location, both latitude and longitude but also
# place, region and country to make it possible to search
# through the table
class Position < ActiveRecord::Base
  belongs_to :user
  has_many :ops

  validates_numericality_of :lat, less_than_or_equal_to: 90
  validates_numericality_of :lat, greater_than_or_equal_to: -90
  validates_numericality_of :lng, less_than_or_equal_to: 180
  validates_numericality_of :lng, greater_than_or_equal_to: -180

  validates :user_id,
            presence: true
  validates :lng,
            presence: true
  validates :lat,
            presence: true
  validates :place,
            presence: true
  validates :region,
            presence: true
  validates :country,
            presence: true
end
