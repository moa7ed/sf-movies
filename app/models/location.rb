class Location < ApplicationRecord
  has_and_belongs_to_many :movies, -> { distinct }

  def in_san_francisco?
    minLat = 37.7
    maxLat = 37.82
    minLong = -122.51
    maxLong = -122.35
    lat < maxLat && lat > minLat && long < maxLong && long > minLong
  end
end
