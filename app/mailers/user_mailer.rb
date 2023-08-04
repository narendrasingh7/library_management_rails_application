class UserMailer < ApplicationMailer
  default from: 'mailertest0222@gmail.com'
  
  def welcome_email
    @user = params[:user]
    puts @user
    @url  = 'http://example.com/login'
    # attachments.inline['image.jpeg'] = File.read('/home/developer/Assignment/Rails/18-07-2023 using Mailers/blog/app/assets/images/image.jpeg')
    mail(to: @user.email, subject: 'Welcome to Online Library')


  end
end
