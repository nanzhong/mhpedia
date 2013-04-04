class MonstersController < ApplicationController
  def index
    @page = params[:page] or 1
    @monsters = Monster.page(@page)
  end

  def show
    @monster = Monster.find(params[:id])

    @rewards = {}
    @monster.monster_rewards.each do |reward|
      @rewards[reward.action] ||= {}
      @rewards[reward.action][reward.rank] ||= []
      @rewards[reward.action][reward.rank] << reward
    end
  end
end
