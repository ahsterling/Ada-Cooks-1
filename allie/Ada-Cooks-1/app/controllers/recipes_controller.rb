class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
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
    recipe = Recipe.new
    @recipe_form = RecipeForm.new(params[:recipe_form], recipe)
    if @recipe_form.submit
      redirect_to recipe_path(@recipe_form.recipe.id)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe_form = RecipeForm.new(params[:recipe_form], @recipe)
    if @recipe_form.update
      redirect_to recipe_path(@recipe_form.recipe.id)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    delete_recipe(recipe)
    redirect_to root_path
  end
  
end
