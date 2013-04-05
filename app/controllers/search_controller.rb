class SearchController < ApplicationController
  def index
    @items_count = Item.count
    @monsters_count = Monster.count
    @monster_rewards_count = MonsterReward.count
    @maps_count = Map.count
    @areas_count = Area.count
    @resources_count = Resource.count
    @combos_count = Combo.count
  end

  def search
    @query = params[:q]

    if @query.blank?
      flash[:error] = "Cannot search with for empty query... :("
      redirect_to root_path
    else
      @items = Item.search("name:#{@query}")
      @maps = Map.search("name:#{@query}")
      @monsters = Monster.search("name:#{@query}")

      @items = @items.reject {|i| i._score < 0.65}
      @monsters = @monsters.reject {|m| m._score < 0.65}
      @maps = @maps.reject {|m| m._score < 0.65}
    end
  end
end
