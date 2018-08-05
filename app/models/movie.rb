class Movie < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :production_companies
end
