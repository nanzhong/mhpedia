class SearchController < ApplicationController
  def index
    @items_count = Item.count
    @monsters_count = Monster.count
    @monster_rewards_count = MonsterReward.count
    @maps_count = Map.count
    @areas_count = Area.count
    @resources_count = Resource.count
    @combos_count = Combo.count
    @armor_skills_count = Skill.where(skill_type: Skill::Type::ARMOR).count
    @felyne_skills_count = Skill.where(skill_type: Skill::Type::FELYNE).count
  end

  def search
    @query = params[:q]

    if @query.blank?
      flash[:error] = "Cannot search with for empty query... :("
      redirect_to root_path
    else
      @items = Item.search("name:#{@query}", per_page: 100)
      @maps = Map.search("name:#{@query}", per_page: 100)
      @monsters = Monster.search("name:#{@query}", per_page: 100)
      @skills = Skill.search("name:#{@query}", per_page: 100)
      @skill_effects = SkillEffect.search("name:#{@query} OR description:#{@query}", per_page: 100)

      @items = @items.reject {|i| i._score < 0.45}
      @monsters = @monsters.reject {|m| m._score < 0.45}
      @maps = @maps.reject {|m| m._score < 0.45}
      @skills = @skills.reject {|s| s._score < 0.45}
      @skill_effects = @skill_effects.reject {|s| s._score < 0.45}
    end
  end
end
