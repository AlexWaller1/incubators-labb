class AddUserToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :user
  end
end
