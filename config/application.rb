require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Porch
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths.push Rails.root.join('lib')

    # render 404 when we couldn't find something in contentful
    config.action_dispatch.rescue_responses['Errors::ModelNotFound'] = :not_found
  end
end
