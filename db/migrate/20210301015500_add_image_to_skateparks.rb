class AddImageToSkateparks < ActiveRecord::Migration[6.1]
  def change
    add_column :skateparks, :image, :string
  end
end
