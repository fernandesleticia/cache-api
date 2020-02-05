module Clear
    def clear
        $redis.flushdb(options = nil)
    end
end