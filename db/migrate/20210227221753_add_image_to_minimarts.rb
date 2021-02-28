class AddImageToMinimarts < ActiveRecord::Migration[6.1]
  def change
    add_column :minimarts, :image, :string
  end
end
