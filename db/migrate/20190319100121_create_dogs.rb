class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :gender
      t.datetime :date_of_birth
      t.string :size
      t.string :breed
      t.string :color
      t.boolean :is_hypoallergenic
      t.boolean :is_sterilized
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
