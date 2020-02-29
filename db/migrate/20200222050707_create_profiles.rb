class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      
      t.string :name
      t.date :birthday
      t.string :work
      t.integer :age
      t.text :content
      t.string :place
      t.string :area
      t.string :hobby
      t.text :country
      t.timestamps
    end
  end
end
