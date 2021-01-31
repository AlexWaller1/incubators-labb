class CreateHybrids < ActiveRecord::Migration[6.1]
  def change
    create_table :hybrids do |t|
      t.string :name
      t.string :type
      t.string :personality
      t.text :biography
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
