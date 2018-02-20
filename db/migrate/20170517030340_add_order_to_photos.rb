class AddOrderToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :order, :integer, :default => 99
    add_column :photos, :link, :string
  end
end
