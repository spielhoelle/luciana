class AddInSliderToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :in_slider, :integer
  end
end
