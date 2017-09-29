class RecettesController < ApplicationController
  def index
    @recettes = Recette.all
  end

  def show
    @recette = Recette.find params[:id]
  end

  def new
    @recette=Recette.new
  end

  def create
    @recette = Recette.new params_recette
    @recette.chef = Chef.first
    if @recette.save
      flash[:success] = "La recette a été enregistée avec succès!!!"
      redirect_to recette_path @recette
    else
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def params_recette
       params.require(:recette).permit(:nomR7,:description)
    end
end
