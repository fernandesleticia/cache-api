# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    Transaction.create({
        date: Faker::Date.in_date_period,
        description: Faker::Lorem.paragraph,
        reference: Faker::Number.number(digits: 10),
        withdrawal:  Faker::Number.number(100000),
        deposit:  Faker::Number.number(100000) 
    })   
end