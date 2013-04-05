class Combo < ActiveRecord::Base
  attr_accessible :item_id, :success_rate, :max, :min, :part_1_id, :part_2_id

  belongs_to :item, inverse_of: :combo
  belongs_to :part_1, foreign_key: 'part_1_id', inverse_of: :combo_part_1, class_name: 'Item'
  belongs_to :part_2, foreign_key: 'part_2_id', inverse_of: :combo_part_2, class_name: 'Item'
end
