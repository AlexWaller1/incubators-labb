class AddHybridsToMinimarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :minimarts, :hybrid
  end
end
