Tareas::Application.configure do
  config.action_mailer.default_url_options = { host: 'tareas.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: 'tareasrails@gmail.com',
    password: 'queclave',
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
