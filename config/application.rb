require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Anime
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g| 
      g.test_framework :rspec,
      fixtures: false, 
      view_specs: false, 
      helper_specs: false, 
      routing_specs: false
    end

    config.to_prepare do
      Devise::SessionsController.layout "log"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "log" }
      Devise::ConfirmationsController.layout "log"
      Devise::UnlocksController.layout "application"            
      Devise::PasswordsController.layout "log"        
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.use Rack::Attack
  end
end
