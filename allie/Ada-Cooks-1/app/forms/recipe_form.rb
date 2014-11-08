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

  def add_existing_ingredients
    @attributes[:other_ingredients].each_value do |ingredient|
      if ingredient[:i_id]
        RecipeIngredient.create(
          ingredient_id: ingredient[:i_id],
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

    if @attributes[:ingredients]
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

    @recipe.recipe_ingredients.each do |ri|
      ri.update(
        unit: @attributes[:existing_ingredients]["ingredient_#{ri.ingredient.id.to_s}"][:unit],
        measurement:  @attributes[:existing_ingredients]["ingredient_#{ri.ingredient.id.to_s}"][:measurement]
      )
    end

    add_existing_ingredients
    new_ingredients


    if @recipe.valid?
      true
    else
      false
    end
  end
end
