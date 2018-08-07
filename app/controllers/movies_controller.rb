class MoviesController < ApplicationController
  def search
    @movies = Movie.all.select {|m| m.title.downcase.include? (params[:q]&.downcase || "") }[0..4]
    render json: @movies.map {|m| {"title": m.title}}.to_a
  end

  def search_for_directors
    @directors = Movie.all.map(&:director).uniq.select {|d| d&.downcase&.include? (params[:q]&.downcase || "") }[0..4]
    render json: @directors.map {|d| {"director": d}}.to_a
  end

  def search_for_writers
    @writers = Movie.all.map(&:writer).uniq.select {|w| w&.downcase&.include? (params[:q]&.downcase || "") }[0..4]
    render json: @writers.map {|w| {"writer": w}}.to_a
  end
end
