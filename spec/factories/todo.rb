FactoryBot.define do
  factory :todo do
    titulo { Faker::Lorem.word }
  end
end