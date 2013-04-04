class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :area_id
      t.integer :item_id

      t.timestamps
    end
  end
end
