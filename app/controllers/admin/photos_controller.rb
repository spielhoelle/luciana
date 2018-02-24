module Admin
  class PhotosController < Admin::ApplicationController
    autocomplete :tag, :title, full: true
    autocomplete :category, :title, full: true

    def index
      @photos = Photo.order(created_at: :desc)
    end

    def edit
      @photo = Photo.find(params[:id])
      @all_photos = Photo.where.not(id: @photo.id)
    end

    def new
      @photo = Photo.new
      render "edit"
    end

    def update
      if params[:id]
        @photo = Photo.find(params[:id])
        @photo.update_attributes(photo_params)
        flash[:notice] = 'Photo has been saved successfully.'
        redirect_to edit_admin_photo_path(@photo)
        raise ActiveRecord::RecordNotFound, "Photo not found" if @photo.nil?
      else
        @photo = Photo.find(params[:id])
      end

    end

    def create
      @photo = Photo.create(photo_params)
      if @photo.save
        flash[:notice] = 'Photo has been created successfully.'
        redirect_to edit_admin_photo_path(@photo)
      else
        render 'edit'
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      flash[:notice] = 'Photo destroyed.'
      redirect_to admin_photos_path
    end

    private
    
    def photo_params
      params.require(:photo).permit(:title, :caption, :order, :link, :image, :in_slider, :parent_id, all_tags: [], all_categories: [])
    end
  end
end
