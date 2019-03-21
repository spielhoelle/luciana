class ContactsController < ApplicationController
  def new
  puts request.inspect
    @contact = Contact.new
    @page_title = "#{@page_title} | Contact"
  end

  def create
    @mail = Mailer.new(allowed_params)
    @mail.request = request
    if @mail.deliver || Rails.env.development?
      flash.now[:notice] = 'Thank you for your message!'
      @contact = Contact.new(allowed_params)
      @contact.save
      respond_to do |format|
        format.html { redirect_to contacts_path }
        format.js
      end
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end


  def allowed_params
    params.require(:contact).permit(:email, :message, :nickname)
  end

end
