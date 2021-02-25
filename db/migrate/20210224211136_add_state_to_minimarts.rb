class AddStateToMinimarts < ActiveRecord::Migration[6.1]
  def change
    add_column :minimarts, :state, :string
  end
end
