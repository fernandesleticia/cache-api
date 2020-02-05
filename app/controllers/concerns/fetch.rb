module Fetch

    def fetch_transactions account_id, range_days
        key = "transactions" + "-" + account_id.to_s + "-" + range_days.to_s
        transactions = $redis.get(key)
        if transactions.nil?
            transactions = Account.transactions(account_id, range_days).to_json
            $redis.set(key, transactions)
            $redis.expire(key, 10.minute.to_i)
        end
        JSON.load transactions
    end
    
  end