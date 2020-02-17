class CreateFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :image
      t.text :content
      t.string :release
      t.timestamps
    end
  end
end
