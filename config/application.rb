require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fwm
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb.yml}').to_s]
    config.i18n.default_locale = :ja
    config.generators do |gen|
      gen.helper false
      gen.assets false
      gen.test_framework :rspec
      gen.controller_specs false
      gen.view_specs false
    end
    config.assets.paths << "#{Rails}/vender/assets/fonts"
  end
end
