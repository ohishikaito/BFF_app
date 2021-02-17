class AddColumnIsSpecialToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :is_special, :boolean
  end
end
