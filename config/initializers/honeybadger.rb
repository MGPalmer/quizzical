Honeybadger.configure do |config|
  config.api_key = Rails.application.credentials.honeybadger[:api_key]
  #  config.exceptions.ignore += [CustomError]
end
