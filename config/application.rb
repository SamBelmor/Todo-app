require_relative 'boot'
require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module TODOApp
  class Application < Rails::Application
    config.load_defaults 5.2

    config.active_job.queue_adapter = :sidekiq
  end
end
