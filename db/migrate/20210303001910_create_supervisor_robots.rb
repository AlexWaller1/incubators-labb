class CreateSupervisorRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :supervisor_robots do |t|
      t.text :evaluation
      t.references :supervisor
      t.references :robot

      t.timestamps
    end
  end
end
