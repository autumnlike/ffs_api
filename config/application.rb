require_relative 'boot'

require 'rails/all'
require 'slack'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FfsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # API MODE 後付け
    config.api_only = true

    # grape 使うと Flash使えないので明示指定
    config.middleware.use ActionDispatch::Flash

    # devise
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    Slack.configure do |c|
      c.token = ENV['SLACK_TOKEN']
    end
  end
end
