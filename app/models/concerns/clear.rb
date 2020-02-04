module Clear
    def clear
        $redis.del "transactions"
        $redis.del "transactions_3"
        $redis.del "transactions_15"
        $redis.del "transactions_30"
    end
end