require 'sidekiq'

Sidekiq.configure_client do |config|
  #config.redis = { :size => 1 }
  config.redis = { url: ENV['REDISTOGO_URL'] }
end

Sidekiq.configure_server do |config|
  #config.redis = { :size => 5 }
  config.redis = { url: ENV['REDISTOGO_URL'] }
end

Sidekiq::Logging.logger.level = Logger::DEBUG
