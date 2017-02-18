require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

class Application < Rails::Application

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  config.log_level = :debug

  #config.autoload_paths += %W(#{config.root}/lib)

  Elasticsearch::Persistence.client = Elasticsearch::Client.new log: true

end
