module Fetch
    def fetch_transactions
        transactions = $redis.get("transactions")
        if transactions.nil?
            transactions = Transaction.all.to_json
            $redis.set("transactions", transactions)
            $redis.expire("transactions", 10.minute.to_i)
        end
        JSON.load transactions
    end

    def fetch_transactions_3_days
        transactions = $redis.get("transactions_3")
        if transactions.nil?
            transactions = Transaction.get_3_day_statement.to_json
            $redis.set("transactions_3", transactions)
            $redis.expire("transactions_3", 10.hour.to_i)
        end
        JSON.load transactions
    end

    def fetch_transactions_15_days
        transactions = $redis.get("transactions_15")
        if transactions.nil?
            transactions = Transaction.get_15_day_statement.to_json
            $redis.set("transactions_15", transactions)
            $redis.expire("transactions_15", 20.hour.to_i)
        end
        JSON.load transactions
    end

    def fetch_transactions_30_days
        transactions = $redis.get("transactions_30")
        if transactions.nil?
            transactions = Transaction.get_30_day_statement.to_json
            $redis.set("transactions_30", transactions)
            $redis.expire("transactions_30", 30.hour.to_i)
        end
        JSON.load transactions
    end
  end