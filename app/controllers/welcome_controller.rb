class WelcomeController < ApplicationController

  def index
    @avatar = Photo.find_by(title: "avatar")
    @page_title = "Luciana Damiao"
    @contact = Contact.new
    @photos = Photo.where.not(title: "avatar").order(order: :asc)
  end

end
