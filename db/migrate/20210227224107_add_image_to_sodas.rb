class AddImageToSodas < ActiveRecord::Migration[6.1]
  def change
    add_column :sodas, :image, :string
  end
end
