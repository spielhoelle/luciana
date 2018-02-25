class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate
  def index
    @categories = Category.joins(:photos).group("categories.id")
    @tags = Tag.joins(:photos).group("tags.id")
    @page_title = "Luciana Damiao"
  end

end
