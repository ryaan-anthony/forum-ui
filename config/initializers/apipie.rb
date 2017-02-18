Apipie.configure do |config|
  config.api_base_url            = "/api"
  config.doc_base_url            = "/docs"
  config.default_version         = "v1"
  config.layout                  = "application"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
