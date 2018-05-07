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
      @photos = Photo.where.not(title: "avatar").where("parent_id IS NULL").order(order: :asc)
    end
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def hidden
    if entry_params[:cat]
      @photos = Category.find_by('title': entry_params[:cat]).photos
    end
    if entry_params[:tag]
      tag = Tag.find_by('title': entry_params[:tag])
      photos = tag.photos
      @photos = @photos.present? ? @photos.merge(photos) : photos
    end

    if !entry_params[:tag] && !entry_params[:cat]
      @photos = Category.where(:hidden => 1).collect{|x| x.photos}.first
    end
    @categories = Category.where(:hidden => 1)
    @tags = Category.where(:hidden => 1).collect{|c| c.photos}.first.collect{|b| b.tags}.reject { |c| c.empty? }.first.uniq
    render 'index'
  end

  def entry_params
    params.permit(:cat, :tag, :hidden)
  end
end
