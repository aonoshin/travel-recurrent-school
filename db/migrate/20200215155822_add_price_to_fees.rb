class AddPriceToFees < ActiveRecord::Migration[5.0]
  def change
    add_column :fees, :price, :integer
  end
end
