class AddPicturesToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :pictures, :json
  end
end
