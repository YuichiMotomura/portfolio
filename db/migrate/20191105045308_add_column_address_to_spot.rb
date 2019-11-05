class AddColumnAddressToSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :address, :string, null: true
  end
end
