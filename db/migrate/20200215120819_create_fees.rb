class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :name
      t.integer :place
      t.integer :user_id
      t.timestamps
    end
  end
end
