class Skill < ActiveRecord::Base
  module Type
    ARMOR = 1
    FELYNE = 2
  end

  attr_accessible :name, :description, :skill_type

  has_many :effects, inverse_of: :skill, class_name: 'SkillEffect'

  include Tire::Model::Search
  include Tire::Model::Callbacks
end
