class CreateMinimarts < ActiveRecord::Migration[6.1]
  def change
    create_table :minimarts do |t|

      t.string :name
      t.string :address
      t.string :sodamachine
      t.text :description

      t.timestamps
    end
  end
end
