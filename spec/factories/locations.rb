FactoryBot.define do
  factory :location do
    address { Faker::Lorem.word }
    movie_ids nil
    lat 37.763120
    long -122.451158
  end
end