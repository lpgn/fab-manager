require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
#require "active_model/railtie"
#require "active_record/railtie"
#require "action_controller/railtie"
#require "action_mailer/railtie"
#require "action_view/railtie"
#require "sprockets/railtie"
#require "rails/test_unit/railtie"
require 'csv'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fablab
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    config.assets.paths << Rails.root.join('vendor', 'assets', 'components').to_s

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.to_prepare do
      Devise::Mailer.layout "notifications_mailer"
    end

    # allow use rails helpers in angular templates
    Rails.application.assets.context_class.class_eval do
      include ActionView::Helpers
      include Rails.application.routes.url_helpers
    end

    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.orm :active_record
    end
  end
end
