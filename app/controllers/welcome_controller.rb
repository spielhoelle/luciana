class WelcomeController < ApplicationController

  def index
    @avatar = Photo.find_by(title: "avatar")
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
end
