FactoryBot.define do
  factory :todo_item do
    descripcion { Faker::Lorem.paragraph }
    hecho false
    todo
  end
end