class Area < ActiveRecord::Base
  attr_accessible :zone

  belongs_to :map
  has_many :resources
end
