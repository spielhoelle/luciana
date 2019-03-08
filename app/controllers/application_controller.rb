class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    if !primary_domain
      @categories = Category.joins(:photos).where(:hidden => "1").group("categories.id")
      @tags = Photo.joins(:categories).where( categories: { hidden: "1" }).collect{|p| p.tags}.flatten.uniq
    else 
      @categories = Category.joins(:photos).where( categories: { hidden: [nil, "0"] }).group("categories.id")
      @tags = Photo.joins(:categories).where( categories: { hidden: [nil, "0"] }).collect{|p| p.tags}.flatten.uniq
    end

    @page_title = "Luciana Damiao"
  end
  def primary_domain
    request.original_url.include?('localhost:3000') || request.original_url.include?('lucianadamiao')
  end
end
