if Rails.env == 'development'
  redis_host = Rails.application.secrets.redis && Rails.application.secrets.redis['host'] || 'redis://localhost'
  redis_port = Rails.application.secrets.redis && Rails.application.secrets.redis['port'] || 6379
else
  redis_host = Rails.application.secrets.redis && Rails.application.secrets.redis['host'] || 'redis://redistogo:24d839cdcb0e1f8895c4c15a9e409885@sole.redistogo.com:9001/'
  redis_port = Rails.application.secrets.redis && Rails.application.secrets.redis['port'] || 9001
end

# The constant below will represent ONE connection, present globally in models, controllers, views etc for the instance. No need to do Redis.new everytime
REDIS = Redis.new(host: redis_host, port: redis_port.to_i)
