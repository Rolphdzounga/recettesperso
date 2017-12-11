class RecettesController < ApplicationController
  before_action :init_recette, only: [:show,:edit,:update,:destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @recettes = Recette.paginate(page: params[:page], per_page: 3)
  end

  def show
    @chef_recettes = @recette
    @commentaires = @recette.commentaires
    @commentaire = Commentaire.new
    @commentaires = @recette.commentaires.paginate(page: params[:page], per_page: 5)
  end

  def new
    @recette=Recette.new
  end

  def create
    @recette = Recette.new params_recette
    @recette.chef =  current_chef
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

    def init_recette
      @recette = Recette.find(params[:id])
    end
    def params_recette
       params.require(:recette).permit(:recettenom,:recettedesc, ingredient_ids: [])
    end
    def require_same_user
      if current_chef != @recette.chef and !current_chef.admin?
        flash[:danger] = "You can only edit or delete your own recipes"
        redirect_to recipes_path
      end  
    end
end
