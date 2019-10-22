class AddPrefectureRefToSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :prefecture, foreign_key: true
  end
end
