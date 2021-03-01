class CreateRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :model
      t.string :function
      t.string :personality
      t.string :image
      t.text :biography

      t.timestamps
    end
  end
end
