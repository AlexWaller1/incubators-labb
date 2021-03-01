class AddImageToSkateboarders < ActiveRecord::Migration[6.1]
  def change
    add_column :skateboarders, :image, :string
  end
end
