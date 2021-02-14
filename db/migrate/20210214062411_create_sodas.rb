class CreateSodas < ActiveRecord::Migration[6.1]
  def change
    create_table :sodas do |t|
      t.string :name
      t.string :company
      t.string :availability
      t.text :description

      t.timestamps
    end
  end
end
