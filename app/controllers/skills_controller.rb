class SkillsController < ApplicationController
  def armor
    @skills = Skill.where(skill_type: Skill::Type::ARMOR).order('name ASC')
  end

  def felyne
    @skills = Skill.where(skill_type: Skill::Type::FELYNE).order('name ASC')
  end

  def show
    @skill = Skill.find(params[:id])
  end
end
