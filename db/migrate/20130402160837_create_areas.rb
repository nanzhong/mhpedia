class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :zone
      t.integer :map_id

      t.timestamps
    end
  end
end
