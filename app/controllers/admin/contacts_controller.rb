module Admin
  class ContactsController < ApplicationController

    def index
      @contacts = Contact.all.reverse
    end
    
    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      flash[:notice] = 'Contact destroyed.'
      redirect_to admin_contacts_path
    end

    def remove_all
      Contact.delete_all
      flash[:notice] = "You have removed all contact!"
      redirect_to admin_contacts_path
    end

  end
end
