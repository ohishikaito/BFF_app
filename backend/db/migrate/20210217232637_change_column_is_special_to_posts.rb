class ChangeColumnIsSpecialToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :is_special, :boolean, default: false
  end
end
