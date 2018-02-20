class CreatePhotoCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_categories do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
