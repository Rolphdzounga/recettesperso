class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]
  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient_recettes = @ingredient.recettes
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)


      if @ingredient.save
        flash[:success] = "Ajout de l'ingredient réussi..."
        redirect_to ingredient_path @ingredient
      else
        flash[:success] = "Ajout de l'ingredient réussi..."
        render :new 
      end

  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
 
      if @ingredient.update(ingredient_params)
        flash[:success] = "M.a.j de l'ingredient réussi..."
        redirect_to ingredient_path @ingredient
      else
        render :edit
      end

  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    flash[:success] = 'Ingredient was successfully destroyed.'
    redirect_to ingredients_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:ingredientnom)
    end

    def require_admin
      if !logged_in? || (logged_in? and !current_chef.admin?)
        flash[:danger] = "Only admin users can perform that action"
        redirect_to ingredients_path
      end
    end
end
