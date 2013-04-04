class Resource < ActiveRecord::Base
  belongs_to :area
  belongs_to :item
end
