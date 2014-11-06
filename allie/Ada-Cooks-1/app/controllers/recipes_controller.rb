class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    # raise params[:recipe_form].inspect
    @recipe_form = RecipeForm.new(params[:recipe_form])
    if @recipe_form.submit
      redirect_to recipe_path(@recipe_form.recipe.id)
    else
      render :new
    end
  end
end
