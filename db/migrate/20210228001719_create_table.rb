class CreateTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :HybridMinimarts

      t.timestamps
    end
  end
end
