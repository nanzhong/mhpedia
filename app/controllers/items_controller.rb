class ItemsController < ApplicationController
  def index
    @page = params[:page] or 1
    @items = Item.page(@page)
  end

  def show
    @item = Item.find(params[:id])
    @maps = {}
    @item.resources.each do |resource|
      @maps[resource.area.map] ||= []
      @maps[resource.area.map] << resource.area
    end
  end
end
