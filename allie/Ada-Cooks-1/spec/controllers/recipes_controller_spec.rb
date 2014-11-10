require "rails_helper"

describe RecipesController do
  describe "GET index" do
    it "assigns @recipes" do
      recipe = Recipe.create
      get :index
      expect(assigns(:recipes)).to eq([recipe])
    end

    it "assigns @ingredients" do
      ingredient = Ingredient.create
      get :index
      expect(assigns(:ingredients)).to eq([ingredient])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end

  end
end
