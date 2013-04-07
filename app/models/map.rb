class Map < ActiveRecord::Base
  attr_accessible :name

  has_many :areas, inverse_of: :map

  default_scope order('name ASC')

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
