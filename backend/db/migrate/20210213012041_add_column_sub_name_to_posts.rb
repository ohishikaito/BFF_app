class AddColumnSubNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sub_name, :string
  end
end
