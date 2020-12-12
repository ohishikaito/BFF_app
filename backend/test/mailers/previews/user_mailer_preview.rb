class UserMailerPreview < ActionMailer::Preview

  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end

  def send_mail
    @user = User.first
    # UserMailer.send_mail(user: User.first) // paramsがuserにネストされて面倒だから使わないで
    UserMailer.send_mail(User.first)
  end
end