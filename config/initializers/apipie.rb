Apipie.configure do |config|
  config.app_name                = "API Documentation"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/docs"
  config.default_version         = "v1"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
