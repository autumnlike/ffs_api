Rails.application.config.middleware.use OmniAuth::Builder do
  #options = { prompt: 'consent', hd: '@lancers.co.jp', name: 'google', scope: %w(email)  }
	# FIXME ドメインを動的に指定したい
	# hd: ドメイン指定
  options = { prompt: 'consent', hd: ENV['GOOGLE_CLIENT_DOMAIN'], name: 'google', scope: %w(email userinfo.profile), skip_jwt: true }
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], options
end
