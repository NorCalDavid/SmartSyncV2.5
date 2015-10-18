# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
										:address => "SMTPOUT.SECURESERVER.NET",
										:domain  => ENV["DOMAIN_NAME"],
										:port      => 80,
										:user_name => ENV["SMTP_USER_NAME"],
										:password => ENV["SMTP_PASSWORD"],
										:authentication => :plain
									}

# Initialize the Rails application.
Rails.application.initialize!