# -*- encoding : utf-8 -*-
file 'config/email.yml', <<-CODE
development:
  address: 'smtp.gmail.com'
  port: '587'
  domain: 'gmail.com'
  user_name: '@gmail.com'
  password: 'secret'
  authentication: :plain
  tls: true
  enable_starttls_auto: true
  
test:

production:
CODE

run "sed \"17aconfig.action_mailer.default_url_options = { :host => 'localhost:3000' }\" config/environments/development.rb > config/environments/development_temp.rb"
run "rm config/environments/development.rb"
run "mv config/environments/development_temp.rb config/environments/development.rb"
