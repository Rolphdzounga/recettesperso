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
    @recette = Recette.find(params[:id]) 
  end

  def update
    @recette = Recette.find(params[:id]) 
    if @recette.update(params_recette)
      flash[:success] = "La recette a été enregistée avec succès!!!"
      redirect_to recette_path @recette
    else
      render 'edit'
    end
  end

  def destroy
    Recette.find(params[:id]).destroy
    flash[:success]="Recette supprimée..."
    redirect_to recettes_path
  end

  private
    def params_recette
       params.require(:recette).permit(:nomR7,:description)
    end
end
