class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description
      t.integer :skill_type

      t.timestamps
    end
  end
end
