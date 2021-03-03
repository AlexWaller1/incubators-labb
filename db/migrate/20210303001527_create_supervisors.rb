class CreateSupervisors < ActiveRecord::Migration[6.1]
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :image
      t.string :experience
      t.text :biography

      t.timestamps
    end
  end
end
