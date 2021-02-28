class Skateparks < ActiveRecord::Migration[6.1]
  def change
    create_table :skateparks do |t|
      t.string :name
      t.string :town
      t.string :state
      t.string :specialty
    end
  end
end
