require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Moscow'
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru
    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
