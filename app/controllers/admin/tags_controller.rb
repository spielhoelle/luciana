module Admin
  class TagsController < Admin::ApplicationController

    def index
      @tags = Tag.left_joins(:photos)
        .group(:id)
        .order('COUNT(photos.id) DESC')
        .limit(10)
    end

    def edit
      @tag = Tag.find(params[:id])
    end

    def new
      @tag = Tag.new
      render "edit"
    end

    def update
      if params[:id]
        @tag = Tag.find(params[:id])
        @tag.update_attributes(tag_params)
        flash[:notice] = 'Tag has been saved successfully.'
        redirect_to edit_admin_tag_path(@tag)
        raise ActiveRecord::RecordNotFound, "Tag not found" if @tag.nil?
      else
        @tag = Tag.find(params[:id])
      end

    end

    def create
      @tag = Tag.create(tag_params)
      if @tag.save
        flash[:notice] = 'Tag has been created successfully.'
        redirect_to edit_admin_tag_path(@tag)
      else
        render 'edit'
      end
    end

    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      flash[:notice] = 'Tag destroyed.'
      redirect_to admin_tags_path
    end

    private

    def tag_params
      params.require(:tag).permit(:title)
    end
  end
end
