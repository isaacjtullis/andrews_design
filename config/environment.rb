# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SEND_GRID_USERNAME"],
  :password => ENV["SEND_GRID_PASSWORD"],
  :key => ENV["SEND_GRID_KEY"],
  :domain => ENV["HEROKU_WEBSITE"],
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => 'login',
  :enable_starttls_auto => true
}
