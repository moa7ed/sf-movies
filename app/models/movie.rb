class Movie < ApplicationRecord
  has_and_belongs_to_many :locations, -> { distinct }
  has_and_belongs_to_many :actors, -> { distinct }
  has_and_belongs_to_many :production_companies, -> { distinct }

  def self.filter (title, director, writer, actor, production_company)
    movies = Movie.all
    movies = movies.select { |m| m.title.downcase == title.downcase } if title.present?
    movies = movies.select { |m| m.director.downcase == director.downcase } if director.present?
    movies = movies.select { |m| m.writer.downcase == writer.downcase } if writer.present?
    movies = movies.select { |m| m.actors.map(&:name).map(&:downcase).include? actor.downcase } if actor.present?
    movies = movies.select { |m| m.production_companies.map(&:name).map(&:downcase).include? production_company.downcase } if production_company.present?
    movies
  end
end