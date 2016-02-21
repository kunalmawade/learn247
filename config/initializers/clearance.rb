Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "kunalmawade@yahoo.com"
  # config.sign_in_guards = []
  # config.allow_sign_up = true
  config.cookie_domain = '.learn247.xyz'
  config.cookie_expiration = lambda { |cookies| 2.days.from_now.utc }
  config.cookie_name = 'remember_token'
  config.cookie_path = '/'
  # config.routes = true
  # config.httponly = false
  # config.mailer_sender = 'kunalmawade@yahoo.com'
  # config.password_strategy = Clearance::PasswordStrategies::BCrypt
  # config.redirect_url = '/'
  # config.secure_cookie = false
  # config.sign_in_guards = [SuspendedCheckGuard]
  # config.user_model = User
end