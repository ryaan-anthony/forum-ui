require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

class Application < Rails::Application

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  config.log_level = :debug

  #config.autoload_paths += %W(#{config.root}/lib)

  Elasticsearch::Persistence.client = Elasticsearch::Client.new log: true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "#{ENV['MAILGUN_ID']}.mailgun.org",
    :user_name => "postmaster@#{ENV['MAILGUN_ID']}.mailgun.org",
    :password => ENV['MAILGUN_PASSWORD']
  }

end
