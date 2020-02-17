class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image
      t.string :place
      t.time :starttime
      t.time :endtime
      t.integer :user_id
      t.timestamps
    end
  end
end
