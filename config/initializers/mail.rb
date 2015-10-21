ActionMailer::Base.smtp_settings = {
  port:               587,
  address:            'smtp.mailgun.org',
  user_name:          ENV['MAILGUN_SMTP_LOGIN'],
  password:           ENV['MAILGUN_SMTP_PASSWORD'],
  domain:             'zerimarks.herokuapp.com',
  authentication:     :plain,
  content_type:       'text/html'
}
ActionMailer::Base.delivery_method = :smtp
# home@app42ec42346fa444adb27f69d7d9c239b9.mailgun.org - use this for testing locally!!
# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail
# only email you
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = 'notifications@zerimarks.herokuapp.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end