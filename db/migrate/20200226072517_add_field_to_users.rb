class AddFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string, null: false, default: ''
    add_column :users, :full_name, :string, null: false, default: ''
    add_column :users, :username, :string, null: false, default: ''
  end
end
