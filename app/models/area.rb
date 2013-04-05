class Area < ActiveRecord::Base
  attr_accessible :zone

  belongs_to :map, inverse_of: :areas
  has_many :resources, inverse_of: :area
end
