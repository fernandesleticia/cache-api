# Cache API

> API that use a cache SQL Query and Russian Doll strategy for a bank statement receipt

## Technologies
> The API was build with Rails and the cache is handle by Redis

## Basic instructions

* Ruby version
> up to 2.5.0

* Rails version
> up to 5.2.0

* Run redis monitor
```bash
$ redis-cli monitor
```

* Running the seed for dummy data
```bash
$ rails db:seed
```
* How to run the test suite
```bash
$ bundle exec rspec
```

## Dependencies

* rspec-rails - A testing framework found at https://github.com/rspec/rspec-rails
* factory_bot_rails - A fixtures replacement with a more straightforward syntax found at https://github.com/thoughtbot/factory_bot_rails
* shoulda_matchers - Provides RSpec with additional matchers. Found at https://github.com/thoughtbot/shoulda-matchers
* faker - A library for generating fake data found at https://github.com/faker-ruby/faker
* database_cleaner - It literally cleans our test database to ensure a clean state in each test suite. Found at https://github.com/DatabaseCleaner/database_cleaner
