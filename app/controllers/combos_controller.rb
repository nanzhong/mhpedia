class CombosController < ApplicationController
  def index
    @combos = Combo.all
  end
end
