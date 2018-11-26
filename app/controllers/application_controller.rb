class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate
  def index
    if !primary_domain
      @categories = Category.joins(:photos).where.not(:hidden => false).group("categories.id")
      @tags = Photo.joins(:categories).where( categories: { hidden: true }).collect{|p| p.tags}.flatten.uniq
    else 
      @categories = Category.joins(:photos).where(:hidden => true).group("categories.id")
      @tags = Photo.joins(:categories).where( categories: { hidden: false }).collect{|p| p.tags}.flatten.uniq
    end

    @page_title = "Luciana Damiao"
  end
  def primary_domain
    request.original_url.include?('localhost:3000') || request.original_url.include?('lucianadamioa')
  end
end
