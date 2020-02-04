# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




account = Account.create({number: 1245})
5.times do
    Transaction.create({
        account: account,
        date: Faker::Date.in_date_period(year: 2019, month: 12),
        description: "2019 DECEMBER",
        reference: Faker::Number.between(from: 1, to: 10000),
        withdrawal:  Faker::Number.decimal(l_digits: 3, r_digits: 3),
        deposit:  Faker::Number.decimal(l_digits: 3, r_digits: 3) 
    })   
end

account = Account.create({number: 6789})
5.times do
    Transaction.create({
        account: account,
        date: Faker::Date.in_date_period(year: 2020, month: 1),
        description: "2020 JANUARY",
        reference: Faker::Number.between(from: 1, to: 10000),
        withdrawal:  Faker::Number.decimal(l_digits: 3, r_digits: 3),
        deposit:  Faker::Number.decimal(l_digits: 3, r_digits: 3) 
    })   
end

account = Account.create({number: 1011})
5.times do
    Transaction.create({
        account: account,
        date: Faker::Date.in_date_period(year: 2020, month: 2),
        description: "2020 FEBRUARY",
        reference: Faker::Number.between(from: 1, to: 10000),
        withdrawal:  Faker::Number.decimal(l_digits: 3, r_digits: 3),
        deposit:  Faker::Number.decimal(l_digits: 3, r_digits: 3) 
    })   
end