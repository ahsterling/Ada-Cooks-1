require "rails_helper"

describe Recipe do
  it 'has a recipe_ingredients method' do
    r = Recipe.create(name: "Cookies", directions: "Bake cookies.")
    expect {r.recipe_ingredients}.not_to raise_error
  end

  it 'has an ingredients method' do
    r = Recipe.create(name: "Cookies", directions: "Bake cookies.")
    expect {r.ingredients}.not_to raise_error
  end

  it '#recipe_ingredients returns all the recipe_ingredients associated with that recipe' do
    r = Recipe.create(name: "Cookies", directions: "Bake cookies.")
    i = Ingredient.create(name: "chocolate chips")
    RecipeIngredient.create(recipe_id: r.id, ingredient_id: i.id, unit: "cup", measurement: 1)
    expect(r.recipe_ingredients.first.unit).to eq "cup"
  end

  it 'can update a recipes recipe_ingredients with unit' do
    r = Recipe.create(name: "Cookies", directions: "Bake cookies.")
    i = Ingredient.create(name: "chocolate chips")
    RecipeIngredient.create(recipe_id: r.id, ingredient_id: i.id, unit: "cup", measurement: 1)
    r.recipe_ingredients.first.update(unit: "teaspoon")
    expect(r.recipe_ingredients.first.unit).to eq "teaspoon"
  end

  it 'can delete a recipe ingredient for a particular recipe' do
    r = Recipe.create(name: "Cookies", directions: "Bake cookies.")
    i = Ingredient.create(name: "chocolate chips")
    RecipeIngredient.create(recipe_id: r.id, ingredient_id: i.id, unit: "cup", measurement: 1)
    r.recipe_ingredients.first.destroy
    expect(r.recipe_ingredients.first).to eq nil
  end
end
