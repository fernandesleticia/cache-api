### Cache API
Russian Doll Caching as a tactic in a bank transation API

#### Starting redis monitor
    ```bash
    $ redis-cli monitor
    ```

#### Running the seed for dummy data
    ```bash
    $ rails db:seed
    ```

#### Dependencies

* rspec-rails - A testing framework. (https://github.com/rspec/rspec-rails)
* factory_bot_rails - A fixtures replacement with a more straightforward syntax. (https://github.com/thoughtbot/factory_bot_rails)
* shoulda_matchers - Provides RSpec with additional matchers. (https://github.com/thoughtbot/shoulda-matchers)
* faker - A library for generating fake data. (https://github.com/faker-ruby/faker)
* database_cleaner - It literally cleans our test database to ensure a clean state in each test suite. (https://github.com/DatabaseCleaner/database_cleaner)
* redis-rails - It provides a full set of stores (Cache, Session, HTTP Cache)for Ruby on Rails.(https://github.com/redis-store/redis-rails)

#### Routes

* getting transactions of a account in a range of days

    > /accounts/:id/transactions/:range_days