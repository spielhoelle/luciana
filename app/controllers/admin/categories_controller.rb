module Admin
  class CategoriesController < Admin::ApplicationController

    def index
      @categories = Category.all
    end

    def edit
      @category = Category.find(params[:id])
    end

    def new
      @category = Category.new
      render "edit"
    end

    def update
      if params[:id]
        @category = Category.find(params[:id])
        @category.update_attributes(category_params)
        flash[:notice] = 'Category has been saved successfully.'
        redirect_to edit_admin_category_path(@category)
        raise ActiveRecord::RecordNotFound, "Category not found" if @category.nil?
      else
        @category = Category.find(params[:id])
      end

    end

    def create
      @category = Category.create(category_params)
      if @category.save
        flash[:notice] = 'Category has been created successfully.'
        redirect_to edit_admin_category_path(@category)
      else
        render 'edit'
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      flash[:notice] = 'Category destroyed.'
      redirect_to admin_categories_path
    end

    private
    
    def category_params
      params.require(:category).permit(:title)
    end
  end
end
