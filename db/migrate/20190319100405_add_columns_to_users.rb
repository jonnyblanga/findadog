class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :role, :string
    add_column :users, :hours_of_operation, :string
    add_column :users, :address, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
