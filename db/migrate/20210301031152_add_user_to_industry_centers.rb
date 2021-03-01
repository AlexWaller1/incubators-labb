class AddUserToIndustryCenters < ActiveRecord::Migration[6.1]
  def change
    add_reference :industry_centers, :user
  end
end
