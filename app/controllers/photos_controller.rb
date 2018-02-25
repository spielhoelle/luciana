class PhotosController < ApplicationController

  def index
    @categories = Category.joins(:photos).group("categories.id")
    @tags = Tag.joins(:photos).group("tags.id")
    @page_title = "Luciana Damiao"
    if entry_params[:cat]
      cat = Category.find_by('title': entry_params[:cat])
      @photos = cat.photos
    elsif entry_params[:tag]
      tag = Tag.find_by('title': entry_params[:tag])
      @photos = tag.photos
    else
      @photos = Photo.where.not(title: "avatar").order(order: :asc)
    end
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def entry_params
    params.permit(:tag, :cat)
  end
end
