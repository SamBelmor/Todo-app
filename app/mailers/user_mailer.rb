class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  CONTACT_EMAIL = 'from@example.com'

  def email_notification(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'tasks to do') do |format|
      format.html
      format.text
    end
  end

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Tasks pending to do') do |format|
      format.text
      format.html
    end
  end
end
