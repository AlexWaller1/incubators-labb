class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.references :robot
      t.references :industry_center
      t.text :performance_review

      t.timestamps
    end
  end
end
