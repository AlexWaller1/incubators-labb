class HybridMinimarts < ActiveRecord::Migration[6.1]
  def change
    create_table :hybrid_minimarts do |t|
      t.text :visit_log
    end
  end
end
