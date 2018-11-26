class AddHiddenToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :hidden, :boolean, :default => 0
  end
end
