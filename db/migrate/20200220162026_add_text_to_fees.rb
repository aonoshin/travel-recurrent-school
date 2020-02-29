class AddTextToFees < ActiveRecord::Migration[5.0]
  def change
    add_column :fees, :text, :text
  end
end
