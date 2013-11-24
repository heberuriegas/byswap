Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], display: 'popup', scope: 'email,read_friendlists,user_online_presence,friends_online_presence,friends_location', image_size: { width: 600, height: 600 }
end
