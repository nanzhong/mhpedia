class Item < ActiveRecord::Base
  attr_accessible :buy, :description, :img, :name, :rarity, :sell

  has_many :resources, inverse_of: :item
  has_many :monster_rewards, inverse_of: :item
  has_one :combo, inverse_of: :item
  has_many :combo_part_1, inverse_of: :part_1, class_name: 'Item'
  has_many :combo_part_2, inverse_of: :part_2, class_name: 'Item'

  default_scope order('name ASC')

  paginates_per 20

  include Tire::Model::Search
  include Tire::Model::Callbacks

  settings ElasticSearchSubstring do
    mapping do
      [:name].each do |attribute|
        indexes attribute, type: 'string', analyzer: 'ngram_analyzer'
      end
    end
  end
end
