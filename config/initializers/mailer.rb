  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  env = Rails.env || :development
  APP_CONFIG = YAML.load_file("#{Rails.root}/config/env.yml")[env]

  Rails.application.config.i18n.default_locale = :en
  Rails.application.config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  Rails.application.config.action_mailer.delivery_method = :smtp
  Rails.application.config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            APP_CONFIG['username'],
    password:             APP_CONFIG['password'],
    authentication:       'plain',
    enable_starttls_auto: true  
  }
