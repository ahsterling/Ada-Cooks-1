class RecipeForm

  def initialize(attributes, recipe)
    @attributes = attributes
    @recipe = recipe
  end

  def recipe
    @recipe
  end

  def new_recipe
    Recipe.create(
      name: @attributes[:name],
      directions: @attributes[:directions]
    )
  end


  def new_ingredients
    @attributes[:new_ingredients].each_value do |ingredient|
      if ingredient[:name] != ""
        new_ingredient = Ingredient.create(name: ingredient[:name])
        RecipeIngredient.create(
          ingredient_id: new_ingredient.id,
          recipe_id: @recipe.id,
          unit: ingredient[:unit],
          measurement: ingredient[:measurement]
        )
      end
    end
  end

  def submit
    # Should probably return whether it was saved or not
    @recipe = new_recipe

    @attributes[:ingredients].each_value do |ingredient|
      if ingredient[:id]
        RecipeIngredient.create(
          ingredient_id: ingredient[:id],
          recipe_id: @recipe.id,
          unit: ingredient[:unit],
          measurement: ingredient[:measurement]
        )
      end
    end

    @attributes[:new_ingredients].each_value do |ingredient|
      if ingredient[:name] != ""
        new_ingredient = Ingredient.create(name: ingredient[:name])
        RecipeIngredient.create(
          ingredient_id: new_ingredient.id,
          recipe_id: @recipe.id,
          unit: ingredient[:unit],
          measurement: ingredient[:measurement]
        )
      end
    end

    if @recipe.valid?
      true
    else
      false
    end
  end

  def update
    @recipe.update(
      name: @attributes[:name],
      directions: @attributes[:directions]
    )

    @attributes[:ingredients].each_value do |ingredient|
      if ingredient[:id]
        recipe_ingredient = RecipeIngredient.find_by(ingredient_id: ingredient[:id])
        recipe_ingredient.update(
          ingredient_id: ingredient[:id],
          recipe_id: @recipe.id,
          unit: ingredient[:unit],
          measurement: ingredient[:measurement]
        )
      end
    end

    new_ingredients
    # new = @attributes[:new_ingredient]
    # new_ingredient = Ingredient.create(name: new[:name])
    # RecipeIngredient.create(
    #   ingredient_id: new_ingredient.id,
    #   recipe_id: @recipe.id,
    #   unit: new[:unit],
    #   measurement: new[:measurement],
    #    )

    if @recipe.valid?
      true
    else
      false
    end
  end
end
