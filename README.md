# Cache API

> API that use a cache SQL Query and Russian Doll strategy for a bank statement receipt

## Technologies
The project was build with Rails and Redis

## Basic instructions

* Ruby version
> up to 2.5.0

* Rails version
> up to 5.2.0

* Running the seed for dummy data
```bash
$ rails db:seed
```

* How to run the test suite
```bash
$ bundle exec rspec
```

## Dependencies

* rspec-rails - Testing framework.
* factory_bot_rails - A fixtures replacement with a more straightforward syntax. You'll see.
* shoulda_matchers - Provides RSpec with additional matchers.
* faker - A library for generating fake data. We'll use this to generate test data.
* database_cleaner - You guessed it! It literally cleans our test database to ensure a clean state in each test suite.
