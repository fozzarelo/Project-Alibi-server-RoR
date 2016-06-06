class Footprint < ApplicationMailer
  # def notify_question_owner(answer)
  #    @answer   = answer
  #    @question = answer.question
  #    @owner    = @question.user
  #    return unless @owner
  #    mail(to: @owner.email, subject: "You got an answer!")
  #  end
  def send_footprint(msg)
    @msg = msg
    mail(to @msg.target_email, subject: "#{@msg.user.username} sends a footprint")
  end
end
