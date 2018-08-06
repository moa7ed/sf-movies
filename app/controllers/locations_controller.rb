class LocationsController < ApplicationController

  def index
    @locations = Location.select { |l| l.lat.present? && l.in_san_francisco? }

    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.long
    end
  end

end