class PhotosController < ApplicationController

  def index
    super
    puts entry_params
    @photos = {}
    if entry_params[:cat]
      cat = Category.find_by('title': entry_params[:cat])
      @photos = cat.photos
    end
    if entry_params[:tag]
      tag = Tag.find_by('title': entry_params[:tag])
      photos = tag.photos
      @photos = @photos.present? ? @photos.merge(photos) : photos
    end
    if !entry_params[:tag] && !entry_params[:cat]
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
