class CreateRobotsIndustryCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :robots_industry_centers do |t|
      t.references :robots
      t.references :industry_centers
      t.string :performance_review

      t.timestamps
    end
  end
end
