class Store < ApplicationRecord
  validates :lonlat, :name, presence: true
  validates :google_place_id, uniqueness: true, presence: true

  has_many :ratings

  scope :within, -> (longitude, latitude, distance_in_km = 5) {
    where(%{
    ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km * 1000])
  }
end
