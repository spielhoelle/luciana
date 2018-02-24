class PhotosController < ApplicationController

  def index
    @photos = Photo.where.not(title: "avatar").order(order: :asc)
  end
  def show
    @photo = Photo.find(params[:id])
  end

end
