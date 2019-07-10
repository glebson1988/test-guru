class FeedbackMailer < ApplicationMailer

  before_action { @mailer = params[:email] }

  default to: 'glebson1988@yandex.ru'

  def send_message(feedback)
    @message = feedback.message
    mail from: @mailer
  end
end
