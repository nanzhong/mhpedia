class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.integer :item_id
      t.integer :part_1_id
      t.integer :part_2_id
      t.integer :success_rate
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
