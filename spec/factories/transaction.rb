FactoryBot.define do
    factory :transaction do
        association :account
        date Faker::Date.in_date_period(year: 2020, month: 4)
        description Faker::Lorem.paragraph
        reference Faker::Number.between(from: 1, to: 1000)
        withdrawal Faker::Number.decimal(l_digits: 3, r_digits: 3) 
        deposit Faker::Number.decimal(l_digits: 3, r_digits: 3) 
    end
  end