class AdminNewMailer < ApplicationMailer
  default from: 'notifications@example.com'
    
   def admin_new(email)
     @email = email

     mail(to: @email, from: "jmljmltaxrelief@gmail.com", subject: 'JML Tax Relief New Account Setup')
   end
end
