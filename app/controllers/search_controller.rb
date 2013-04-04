class SearchController < ApplicationController
  def index
    @items_count = Item.count
    @maps_count = Map.count
    @areas_count = Area.count
    @resources_count = Resource.count
  end

  def search
    @query = params[:q]
    @items = Item.basic_search(name: @query)
    @maps = Map.basic_search(name: @query)
  end
end
