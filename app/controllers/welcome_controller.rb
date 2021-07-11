class WelcomeController < ApplicationController

  def index
    if primary_domain
      @avatar = Photo.find_by(title: "avatar_luciana")
    else 
      @avatar = Photo.find_by(title: "avatar_brenda")
    end
    if !primary_domain
      photos = Photo.joins(:categories).where( categories: { hidden: 1 }).where.not(:title => "avatar").where("parent_id IS NULL")
      @photos = photos.order(order: :asc)
      slides = photos.where("in_slider IS NOT NULL").order(in_slider: :asc)
      @slides = slides.any? ? slides : photos.limit(3)
    else
      photos = Photo.joins(:categories).where( categories: { hidden: [nil, "0"] }).where.not(:title => "avatar").where("parent_id IS NULL")
      @photos = photos.order(order: :asc)
      slides = photos.where("in_slider IS NOT NULL").order(in_slider: :asc)
      @slides = slides.any? ? slides : photos.limit(3)
    end
  end
  def about
    if primary_domain
      @avatar = Photo.find_by(title: "avatar_luciana")
    else 
      @avatar = Photo.find_by(title: "avatar_brenda")
    end
    
    if !@avatar.nil? && @avatar.caption != ""
      puts @avatar.caption.inspect
      render 'about'
    else
      redirect_to action: "index"
    end
  end
end
