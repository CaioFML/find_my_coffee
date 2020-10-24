class Store < ApplicationRecord
  validates :lonlat, :name, presence: true
  validates :google_place_id, uniqueness: true, presence: true

  has_many :ratings
end
