class AddUserToRobots < ActiveRecord::Migration[6.1]
  def change
    add_reference :robots, :user
  end
end
