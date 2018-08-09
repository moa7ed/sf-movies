FactoryBot.define do
  factory :movie do
    director { Faker::Lorem.word }
    writer { Faker::Lorem.word }
    title { Faker::Lorem.word }
    location_ids nil
    actor_ids nil
    production_company_ids nil
  end
end