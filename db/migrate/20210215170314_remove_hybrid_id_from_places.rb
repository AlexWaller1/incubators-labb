class RemoveHybridIdFromPlaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :hybrid_id
  end
end
