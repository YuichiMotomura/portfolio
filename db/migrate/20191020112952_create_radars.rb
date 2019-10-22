class CreateRadars < ActiveRecord::Migration[5.2]
  def change
    create_table :radars do |t|
      t.integer :retro
      t.integer :rare
      t.integer :insta
      t.integer :emotional
      t.integer :delicious
      t.integer :kawaii
      t.references :spot, foreign_key: true
      t.timestamps
    end
  end
end
