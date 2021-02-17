class AddSpPostCountToUsers < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :sp_post_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :users, :sp_post_count
  end
end
