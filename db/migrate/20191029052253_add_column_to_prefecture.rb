class AddColumnToPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :ancestry, :string
    add_index :prefectures, :ancestry
  end
end
