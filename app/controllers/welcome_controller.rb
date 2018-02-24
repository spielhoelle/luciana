class WelcomeController < ApplicationController

  def index
    @avatar = Photo.find_by(title: "avatar")
    @page_title = "Luciana Damiao"
    @contact = Contact.new
    @photos = Photo.where.not(title: "avatar").order(order: :asc)
    slides = Photo.where("in_slider IS NOT NULL") 
    @slides = slides.any? ? slides : Photo.where.not(title: "avatar").limit(3)
  end

end
