class AddParentToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :parent_id, :integer
  end
end
