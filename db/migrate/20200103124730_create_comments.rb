class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment, null: false, limit: 140
      t.integer :user_id, null: false
      t.integer :spot_id, null: false

      t.timestamps
    end
  end
end
