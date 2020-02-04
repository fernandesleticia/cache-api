# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1.times do
#     Account.create({
#         number: 1234, 
#     })   
# end

account_let = Account.create({number: 1235})
10.times do
    Transaction.create({
        account: account_let,
        date: Faker::Date.in_date_period(year: 2020, month: 1),
        description: "LESS THAN 30 DAYS",
        reference: Faker::Number.between(from: 1, to: 10000),
        withdrawal:  Faker::Number.decimal(l_digits: 3, r_digits: 3),
        deposit:  Faker::Number.decimal(l_digits: 3, r_digits: 3) 
    })   
end