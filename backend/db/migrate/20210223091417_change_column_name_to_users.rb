class ChangeColumnNameToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name, :string

    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end
end
