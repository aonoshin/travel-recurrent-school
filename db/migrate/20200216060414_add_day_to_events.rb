class AddDayToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :day, :date
  end
end
