class ProductionCompany < ApplicationRecord
  has_and_belongs_to_many :movies, -> { distinct }
end
