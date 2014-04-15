class WebController < ApplicationController
  
  def index
    @titles = ["Github", "Twitter", "Linkedin", "Xing"]
    @links  = ["https://github.com/purbon", "https://twitter.com/purbon", "http://www.linkedin.com/in/purbon",
               "http://www.xing.com/profile/Pere_UrbonBayes2"]
    @imgs   = ["github.png", "twitter.png", "linkedin.png", "xing.jpg"]
    @total  = 4
  end

  def cv
  end

  def contactme
  end

  def send_contact
    from = params[:name] || 'Default'
    email = params[:email]
    message = params[:message] || ''
    ContactMailer.contact_email(from, email, message).deliver rescue ""
    fields = { :name => from, :from => email, :message => message }
    Contact.create(fields)
    respond_to do |format|
      flash[:notice] = "Message delivered"
      format.html { redirect_to :contactme, :alert => 'send' }
    end
  end

end
