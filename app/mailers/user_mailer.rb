class UserMailer < ApplicationMailer
  default from: 'notifications@zerimarks.herokuapp.com'

  def welcome_email(user)
    @user = user
    @url = 'http://zerimarks.herokuapp.com/sign_up'
    mail(to: @user.email, subject: 'Welcome to Zerimarks')
  end
end
