class RemoveHybridIdFromMinimarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :minimarts, :hybrid_id
  end
end
