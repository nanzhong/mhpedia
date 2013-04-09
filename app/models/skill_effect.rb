class SkillEffect < ActiveRecord::Base
  attr_accessible :skill_id, :description, :name, :points

  belongs_to :skill, inverse_of: :effects

  include Tire::Model::Search
  include Tire::Model::Callbacks
end
