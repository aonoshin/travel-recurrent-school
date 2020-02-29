class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.text :content
      t.string :release
      t.timestamps
    end
  end
end
