class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.smtp_server.user_name
  layout 'mailer'
end

