class Resource < ActiveRecord::Base
  belongs_to :area, inverse_of: :resources
  belongs_to :item, inverse_of: :resources
end
