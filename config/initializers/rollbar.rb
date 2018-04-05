Rollbar.configure do |config|
  # Without configuration, Rollbar is enabled in all environments.
  # To disable in specific environments, set config.enabled=false.

  config.enabled = true
  config.access_token = '2220d6691c7b4bf4ad90c4644edb4dc6'

  config.js_enabled = true
  config.js_options = {
    accessToken: "7810377281b243558cd52b0af01d418f",
    autoInstrument: true,
    networkResponseHeaders: true,
    networkResponseBody: true,
    networkRequestBody: true,
    captureUncaught: true,
    payload: {
      environment: "production"
    }
  }

  # config.person_method = "current_user"
  # config.person_id_method = "current_user.id"
  # config.person_username_method = "get_username"
  # config.person_email_method = "current_user.email"

  # config.exception_level_filters.merge!({
  #   "CanCan" => "ignore"
  # })

  handler = proc do |options|
    payload = options[:payload]

    payload['data']['person']['id'] = 'auth123'
  end

  config.transform << handler

  config.scrub_fields |= [:_railbar_session, :_csrf_token, :controller]

end
