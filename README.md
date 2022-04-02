### Cache API
Russian Doll Caching as a tactic in a bank transation API


#### Starting redis

* Run redis monitor
    ```bash
    $ redis-cli monitor
    ```
* Running the seed for dummy data
    ```bash
    $ rails db:seed
    ```

#### Dependencies

* rspec-rails - A testing framework found at https://github.com/rspec/rspec-rails
* factory_bot_rails - A fixtures replacement with a more straightforward syntax found at https://github.com/thoughtbot/factory_bot_rails
* shoulda_matchers - Provides RSpec with additional matchers. Found at https://github.com/thoughtbot/shoulda-matchers
* faker - A library for generating fake data found at https://github.com/faker-ruby/faker
* database_cleaner - It literally cleans our test database to ensure a clean state in each test suite. Found at https://github.com/DatabaseCleaner/database_cleaner

#### Routes

* getting transactions of a account in a range of days

    > /accounts/:id/transactions/:range_days