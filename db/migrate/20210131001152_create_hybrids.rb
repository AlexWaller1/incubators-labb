class CreateHybrids < ActiveRecord::Migration[6.1]
  def change
    create_table :hybrids do |t|
      t.string :name
      t.string :species
      t.string :personality
      t.text :biography
      t.string :image
      t.references :user

      t.timestamps
    end
  end
end
