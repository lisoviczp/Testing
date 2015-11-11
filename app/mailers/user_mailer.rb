class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    # mail(to: "phillip.lisovicz@nielsen.com", subject: 'welcome to my awesome site')
  end

  def commission_notify_email(user)
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "You've been commissioned!")
    # mail(to: "phillip.lisovicz@nielsen.com", subject: 'welcome to my awesome site')
  end


end
