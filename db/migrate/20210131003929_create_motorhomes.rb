class CreateMotorhomes < ActiveRecord::Migration[6.1]
  def change
    create_table :motorhomes do |t|
      t.string :model
      t.string :image
      t.integer :year
      t.text :features
      t.integer :mileage
      t.text :history


      t.timestamps
    end
  end
end
