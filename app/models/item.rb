class Item < ActiveRecord::Base
  attr_accessible :buy, :description, :img, :name, :rarity, :sell

  has_many :resources

  default_scope order('name ASC')

  paginates_per 20
end
