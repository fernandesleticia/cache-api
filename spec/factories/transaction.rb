FactoryBot.define do
    factory :todo do
        date Faker::Date.in_date_period
        description Faker::Lorem.paragraph
        reference Faker::Number.number(digits: 10)
        withdrawal { Faker::Number.number(100000) }
        deposit { Faker::Number.number(100000) }
    end
  end