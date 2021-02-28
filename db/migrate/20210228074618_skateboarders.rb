class Skateboarders < ActiveRecord::Migration[6.1]
  def change
    create_table :skateboarders do |t|
      t.string :name
      t.string :experience
      t.text :favorite_spots
      t.references :skatepark

    end

  end
end
