class WelcomeController < ApplicationController

  def index
    super
    @avatar = Photo.find_by(title: "avatar")
    @page_title = "Luciana Damiao"
    @contact = Contact.new
    if !primary_domain
      @photos = Photo.joins(:categories).where( categories: { hidden: true }).where.not(:title => "avatar").where("parent_id IS NULL").order(order: :asc)
    else 
      @photos = Photo.where.not(:title => "avatar").where("parent_id IS NULL").order(order: :asc)
    end
    # @photos = Photo.where.not(title: "avatar").where("parent_id IS NULL").order(order: :asc)
    slides = Photo.where("in_slider IS NOT NULL").order(in_slider: :asc)
    @slides = slides.any? ? slides : Photo.where.not(title: "avatar").limit(3)
  end

end
