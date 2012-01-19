# Load the rails application
require File.expand_path('../application', __FILE__)
require 'tlsmail'
# Initialize the rails application
Moonlyte::Application.initialize!

# Set up the environment for Mailer
##config.action_mailer.delivery_method = :smtp
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.raise_delivery_eerors = true
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.deliver_method = :smtp
ActionMailer::Base.server_settings = {
	:address => "smtp.google.com",
	:port => 587,
	:tls => true,
	:user_name => "zhi.moonlyt@gmail.com",
	:password => "admin1123581321",
	:domain => "system@moonlyt.com",
	:authentication => :plain
}

