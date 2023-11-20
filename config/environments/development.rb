# frozen_string_literal: true

def configure_caching(config)
  if Rails.root.join('tmp/caching-dev.txt').exist?
    enable_caching(config)
  else
    disable_caching(config)
  end
end

def enable_caching(config)
  config.action_controller.perform_caching = true
  config.action_controller.enable_fragment_cache_logging = true

  configure_memory_store(config)
end

def disable_caching(config)
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
end

def configure_memory_store(config)
  config.cache_store = :memory_store
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
end
