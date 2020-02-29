class AddReleaseToFees < ActiveRecord::Migration[5.0]
  def change
    add_column :fees, :release, :string
  end
end
