class AddUserIdToFaculties < ActiveRecord::Migration[5.0]
  def change
    add_column :faculties, :user_id, :integer
  end
end
