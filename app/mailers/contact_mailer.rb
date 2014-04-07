class ContactMailer < ActionMailer::Base
  default to: "pere.urbon@gmail.com"
  
  def contact_email(from, email, message="")
   subject = "Message from #{from}"
   @message = message
   @from = 'pere.urbon@gmail.com'
   mail(from: @from, subject: subject)
  end

end
