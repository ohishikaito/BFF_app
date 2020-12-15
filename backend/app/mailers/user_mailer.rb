class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'hoge')
  end

  def send_mail(user)
    @user = user
    mail(
      from: Rails.application.credentials[:gmail][:address],
      to: @user.email,
      subject: 'お問い合わせ通知'
    )
  end
end
