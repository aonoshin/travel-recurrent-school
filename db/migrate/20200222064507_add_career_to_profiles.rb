class AddCareerToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :career, :text
  end
end
