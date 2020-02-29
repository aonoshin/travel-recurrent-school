class AddCarrerToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :carrer, :text
  end
end
