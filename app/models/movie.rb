class Movie < ApplicationRecord
  has_and_belongs_to_many :locations, -> { distinct }
  has_and_belongs_to_many :actors, -> { distinct }
  has_and_belongs_to_many :production_companies, -> { distinct }
end
