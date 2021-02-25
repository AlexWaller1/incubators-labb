class AddUserToMinimarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :minimarts, :user
  end
end
