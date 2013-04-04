class CreateMonsterRewards < ActiveRecord::Migration
  def change
    create_table :monster_rewards do |t|
      t.integer :monster_id
      t.integer :item_id
      t.string :rank
      t.string :action
      t.integer :drop_rate

      t.timestamps
    end
  end
end
