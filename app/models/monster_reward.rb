class MonsterReward < ActiveRecord::Base
  attr_accessible :rank, :action, :drop_rate, :item_id, :monster_id

  belongs_to :monster, inverse_of: :monster_rewards
  belongs_to :item, inverse_of: :monster_rewards
end
