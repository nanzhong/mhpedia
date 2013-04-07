class Monster < ActiveRecord::Base
  attr_accessible :name

  has_many :monster_rewards, inverse_of: :monster

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

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
