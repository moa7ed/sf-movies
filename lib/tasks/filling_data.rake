require 'soda/client'

namespace :filling_data do
  desc "TODO"
  task read_data_from_Socrata_SF_Data: :environment do
    puts "Send request to data.sfgov.org"
    soda_client = SODA::Client.new({:domain => "data.sfgov.org", :app_token => Rails.application.config.movie_locations_app_token})

    results = soda_client.get("wwmu-gmzc", :$limit => 5000)

    puts "Got #{results.count} results"
    results.each do |movie_data|
      ActiveRecord::Base.transaction do
        movie_title = movie_data["title"]
        puts "Adding movie: (#{movie_title})"

        movie = Movie.where(title: movie_title).first || Movie.new
        movie.title = movie_title
        movie.director = movie_data["director"]
        movie.writer = movie_data["writer"]
        movie.release_year = movie_data["release_year"]
        
        movie_locations = movie_data["locations"]&.split("/")
        movie_locations&.each do |movie_location|
          location = Location.where(address: movie_location).first || Location.new
          location.address =  movie_location
          
          if location.lat.blank?
            puts "retrieving lat and long for studio (#{movie_location})"
            coordinates = Geocoder.search(movie_location)&.first&.coordinates
            next if coordinates.blank?
            location.lat = coordinates&.first
            location.long = coordinates&.last
          end

          location.movies << movie unless location.movies.include?(movie)
          movie.locations << location unless movie.locations.include?(location)
          location.save
        end
        
        movie_production_companies = movie_data["production_company"]&.split("/")
        movie_production_companies&.each do |movie_production_company|
          production_company = ProductionCompany.where(name: movie_production_company).first || ProductionCompany.new
          production_company.name =  movie_production_company
          production_company.movies << movie unless production_company.movies.include?(movie)
          movie.production_companies << production_company unless movie.production_companies.include?(production_company)
          production_company.save
        end
        
        movie_actors = [movie_data["actor_1"], movie_data["actor_2"], movie_data["actor_3"]]
        movie_actors&.each do |movie_actor|
          if (movie_actor.present?)
            actor = Actor.where(name: movie_actor).first || Actor.new
            actor.name =  movie_actor
            actor.movies << movie unless actor.movies.include?(movie)
            movie.actors << actor unless movie.actors.include?(actor)
            actor.save
          end
        end

        movie.save
      end
    end
  end

end
