class AddColumnToSpot < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :author, foreign_key: { to_table: :users } 
  end
end
