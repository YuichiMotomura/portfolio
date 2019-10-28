class RemoveColumnFromRadar < ActiveRecord::Migration[5.2]
  def change
    remove_column :radars, :delicious, :integer
  end
end
