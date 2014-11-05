class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params.require(:ingredient).permit(:name))
    if @ingredient.save
      render "recipes/new"
    end
  end

end
