class RemovePlaceToFees < ActiveRecord::Migration[5.0]
  def change
    remove_column :fees, :place, :integer
  end
end
