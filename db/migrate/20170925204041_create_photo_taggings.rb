class CreatePhotoTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_taggings do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
