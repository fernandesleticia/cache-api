$redis = Redis::Namespace.new("api_point", :redis => Redis.new)