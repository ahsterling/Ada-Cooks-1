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

  def index
    @ingredients = Ingredient.all
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(params.require(:ingredient).permit(:name))
      redirect_to ingredients_path
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      redirect_to ingredients_path
    end
  end

end
