class Map < ActiveRecord::Base
  attr_accessible :name

  has_many :areas

  default_scope order('name ASC')
end
