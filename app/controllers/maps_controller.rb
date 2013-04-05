class MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
    @areas = @map.areas.order("zone ASC")
  end
end
