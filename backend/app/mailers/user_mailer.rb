class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'hoge')
  end
  
  def send_mail(user)
    # p user
    @user = user
    mail(
      from: 'zipmoko2@gmail.com',
      to: @user.email,
      subject: 'お問い合わせ通知'
    )
  end
end
