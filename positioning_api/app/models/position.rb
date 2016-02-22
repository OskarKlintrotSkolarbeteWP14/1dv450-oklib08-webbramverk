# Stores a location, both latitude and longitude but also
# place, region and country to make it possible to search
# through the table
class Position < ActiveRecord::Base
  has_many :ops

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
