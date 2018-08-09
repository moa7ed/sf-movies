class Location < ApplicationRecord
  has_and_belongs_to_many :movies, -> { distinct }

  def self.filter (movie_names, address)
    locations = []
    if movie_names.present?
      Location.all.each do |l|
        movies = []
        l.movies.each do |m|
          movies << m if (movie_names.map(&:downcase).include? m.title.downcase)
        end
        if movies.count > 0
          new_location = l.clone
          new_location.movies = movies
          locations << new_location
        end
      end
    else
      locations = Location.all
    end
    locations = locations.select { |l| l.lat.present? && l.in_san_francisco? }
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
