class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :img
      t.integer :rarity
      t.integer :buy
      t.integer :sell

      t.timestamps
    end
  end
end
