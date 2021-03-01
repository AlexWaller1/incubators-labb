class CreateIndustryCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :industry_centers do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :performance
      t.string :image
      t.text :future_goals

      t.timestamps
    end
  end
end
