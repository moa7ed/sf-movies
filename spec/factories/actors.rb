FactoryBot.define do
  factory :actor do
    name { Faker::Lorem.word }
    movie_ids nil
  end
end