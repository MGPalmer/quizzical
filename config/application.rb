require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VhostVsHerokuTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    unless Rails.env.test?
      config.active_job.queue_adapter = :sidekiq
      config.active_job.queue_name_prefix = "quizzical"
    end

    if Rails.env.production? or (Rails.env.development? and ENV["SEND_REAL_MAILS_IN_DEVELOPMENT"] == "true")
      config.action_mailer.smtp_settings = {
        address: Rails.application.credentials.hosteurope[:smtp][:server],
        port: 465,
        user_name: Rails.application.credentials.hosteurope[:smtp][:user_name],
        password: Rails.application.credentials.hosteurope[:smtp][:password],
        authentication: :plain,
        enable_starttls_auto: true,
        tls: true,
      }
    end
  end
end
