class MonsterReward < ActiveRecord::Base
  attr_accessible :rank, :action, :drop_rate, :item_id, :monster_id

  belongs_to :monster
  belongs_to :item
end
