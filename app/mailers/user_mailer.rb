class UserMailer < ApplicationMailer
  default from: 'mailertest0222@gmail.com'
  
  def welcome_email(user)
    @user = user
    @url  = 'http://elibrary.com/login'
    attachments.inline['b.jpg'] = File.read('/home/developer/Project/library/app/assets/images/b.jpg')
    mail(to: @user.email, subject: 'Welcome to Online E Library mail By Narendra Singh')


  end
end
