class AdminNewMailer < ApplicationMailer
  default from: 'notifications@example.com'
    
   def admin_new(email)
     @email = email

     mail(to: @email, from: ENV['EMAIL_USERNAME'], subject: 'JML Tax Relief New Account Setup')
   end
end
