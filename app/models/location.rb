class Location < ApplicationRecord
  has_and_belongs_to_many :movies, -> { distinct }

  def self.filter (movie_names, address)
    locations = Location.all.includes(:movies)
    if movie_names.present?
      locations = locations.select {|l| (l.movies.map(&:title).map(&:downcase) & movie_names.map(&:downcase)).count > 0}
    end
    locations = locations.select { |l| l.in_san_francisco? }
    locations = locations.select { |l| l.address.downcase.include? (address.downcase) } if address.present?
    locations
  end


  def in_san_francisco?
    minLat = 37.7
    maxLat = 37.82
    minLong = -122.51
    maxLong = -122.35
    lat.present? && long.present? && lat < maxLat && lat > minLat && long < maxLong && long > minLong
  end
end
