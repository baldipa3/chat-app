FactoryBot.define do
  factory :room do
    name { Faker::Lorem.unique.word }
  end
end
