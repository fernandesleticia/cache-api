module Fetch
    def fetch_transactions
        transactions = $redis.get("transactions")
        if transactions.nil?
            transactions = Transaction.all.to_json
            $redis.set("transactions", transactions)
            $redis.expire("transactions", 10.hour.to_i)
        end
        JSON.load transactions
    end
  end