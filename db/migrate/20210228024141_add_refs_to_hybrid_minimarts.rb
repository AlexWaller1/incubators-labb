class AddRefsToHybridMinimarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :hybrid_minimarts, :hybrid
    add_reference :hybrid_minimarts, :minimart
  end
end
