class LocationsController < ApplicationController

  def index
    @movies = Movie.filter(params[:movie], params[:director], params[:writer], params[:actor], params[:production_company])
    
    @locations = Location.filter(@movies.map(&:title), params[:address])
    
    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.long
      marker.infowindow location.address + "<br /> <br /> Movies:<br />" + location.movies.all.map(&:title).join("<br />")
    end
  end

  def search
    @locations = Location.all.select {|l| l.in_san_francisco? && (l.address&.downcase.include? (params[:q]&.downcase || "")) }[0..4]
    render json: @locations.map {|l| {"address": l.address}}.to_a
  end

end
