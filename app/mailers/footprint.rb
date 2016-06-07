class Footprint < ApplicationMailer
  def send_footprint(msg)
    @msg = msg
    mail(to: @msg.target_email, subject: "#{@msg.user.username} was spotted")
  end
end
