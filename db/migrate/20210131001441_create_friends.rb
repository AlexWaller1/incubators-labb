class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :species
      t.string :personality
      t.text :biography
      t.string :image
      t.references :hybrid

      t.timestamps
    end
  end
end
