class CreateSkillEffects < ActiveRecord::Migration
  def change
    create_table :skill_effects do |t|
      t.integer :skill_id
      t.string :name
      t.integer :points
      t.string :description

      t.timestamps
    end
  end
end
