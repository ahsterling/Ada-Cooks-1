class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def delete_ingredient(ingredient)
    ingredient.recipe_ingredients.each do |ri|
      ri.destroy
    end
    ingredient.destroy
  end

  def delete_recipe(recipe)
    recipe.recipe_ingredients.each do |ri|
      ri.destroy
    end
    recipe.destroy
  end

end
