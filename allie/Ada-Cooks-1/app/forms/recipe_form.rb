class RecipeForm

  def initialize(attributes)
    @attributes = attributes

  end

  def recipe
    @recipe
  end

  def submit
    # Should probably return whether it was saved or not
    @recipe = Recipe.create(
      name: @attributes[:name],
      directions: @attributes[:directions]
    )

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

    new = @attributes[:new_ingredient]
    new_ingredient = Ingredient.create(name: new[:name])
    RecipeIngredient.create(
      ingredient_id: new_ingredient.id,
      recipe_id: @recipe.id,
      unit: new[:unit],
      measurement: new[:measurement],
       )

    if @recipe.valid?
      true
    else
      false
    end
  end

end
