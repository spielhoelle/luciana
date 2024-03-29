class PhotosController < ApplicationController

  def index
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
      @photos = Photo.joins(:categories).where( categories: { hidden: [nil, "0"] }).where("parent_id IS NULL").order(order: :asc)
      if !primary_domain
        @photos = Photo.joins(:categories).where( categories: { hidden: 1 }).where.not(:title => "avatar_brenda").where.not(:title => "avatar_luciana").where("parent_id IS NULL").order(order: :asc)
      end
    end
  end
  def show
    @photo = Photo.find(params[:id])
  end
  def entry_params
    params.permit(:cat, :tag, :hidden)
  end
end
