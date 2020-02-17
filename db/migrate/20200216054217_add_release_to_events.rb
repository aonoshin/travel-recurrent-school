class AddReleaseToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :release, :string
  end
end
