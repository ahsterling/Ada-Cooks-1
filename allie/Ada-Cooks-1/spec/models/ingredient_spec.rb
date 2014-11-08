require "rails_helper"

describe Ingredient do

  it "has a recipe_ingredients method that returns an Active Record Collection" do
    i = Ingredient.create(name: "test")
    RecipeIngredient.create(ingredient_id: i.id)
    expect(i.recipe_ingredients.class).to eq RecipeIngredient::ActiveRecord_Associations_CollectionProxy
  end

  it 'has a recipes method that returns an active record collection' do
    i = Ingredient.create(name: "test")
    RecipeIngredient.create(ingredient_id: i.id)
    expect(i.recipes.class).to eq Recipe::ActiveRecord_Associations_CollectionProxy
  end

  it 'can change its name attribute' do
    i = Ingredient.create(name: "test")
    i.name = "chocolate chip"
    i.save
    expect(i.name).to eq "chocolate chip"
  end

  it "can be deleted" do
    i = Ingredient.create(name: "test")
    Ingredient.find(i.id).destroy
    expect {Ingredient.find(i.id)}.to raise_error
  end

  it 'can update one of the ingredients recipe_ingredients' do
    i = Ingredient.create(name: "test")
    RecipeIngredient.create(ingredient_id: i.id, unit: "cup", measurement: 1)
    ri = i.recipe_ingredients.find_by(unit: "cup")
    ri.unit = "teaspoon"
    ri.save
    expect(ri.unit).to eq "teaspoon"
  end

end
