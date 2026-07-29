require_relative "boot"

require "rails"
require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module EvaluationCompatibilityApp
  class Application < Rails::Application
    config.root = File.expand_path("..", __dir__)
    config.load_defaults 8.1
    config.eager_load = false
    config.secret_key_base = "evaluation-compatibility-app-secret-key-base"
    config.hosts.clear
    config.active_support.deprecation = :stderr
  end
end
