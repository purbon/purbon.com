class WebController < ApplicationController
  
  def index
  end

  def cv
  end

  def contactme
  end

  def communications
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
