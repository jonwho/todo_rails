OmniAuth.config.full_host = Rails.env.production? ? 'https://jonwho-todo.herokuapp.com' : 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['GOOGLE_OAUTH2_CLIENTID'],
    ENV['GOOGLE_OAUTH2_SECRET']
end
