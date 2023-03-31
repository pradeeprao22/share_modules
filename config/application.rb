require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LondevApp
  class Application < Rails::Application
    config.to_prepare do
      Devise::SessionsController.layout "frontpage"
      #if Devise::RegistrationsController.action "edit"
        Devise::RegistrationsController.layout "frontpage"
      #elsif Devise::RegistrationsController.action "create"
        #Devise::RegistrationsController.layout "frontpage"
      #end
      Devise::ConfirmationsController.layout "frontpage"
      Devise::UnlocksController.layout "frontpage"
      Devise::PasswordsController.layout "frontpage"
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.action_cable.mount_path = '/websocket'
    config.exceptions_app = ->(env) { ExceptionController.action(:show).call(env) }
    #path for fonts
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.unknown_asset_fallback = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_job.queue_adapter = :sidekiq
    # Disabling the CSRF FOR APPLICATION
    # config.action_controller.default_protect_from_forgery = false # unless ENV["RAILS_ENV"] == "production"
  end
end
