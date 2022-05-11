class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(remote_ip)
    AdminMailer.with(remote_ip: remote_ip).authentification_notify.deliver_now
  end
end
