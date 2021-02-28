class AddUserToSkateparks < ActiveRecord::Migration[6.1]
  def change
    add_reference :skateparks, :user
  end
end
