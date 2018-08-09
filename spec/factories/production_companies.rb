FactoryBot.define do
  factory :production_company do
    name { Faker::Lorem.word }
    movie_ids nil
  end
end