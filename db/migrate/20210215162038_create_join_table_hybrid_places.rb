class CreateJoinTableHybridPlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :hybrid_places do |t|
      t.references :hybrid
      t.references :place
      t.string :address, null: false
    end
  end
end
