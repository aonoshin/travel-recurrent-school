class RemoveCarrerFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :carrer, :text
  end
end
