class ChefsController < ApplicationController
	before_action :init_chef, only: [:show,:edit,:update,:destroy]
  before_action :require_admin, only: [:destroy]


	def new
		@chef = Chef.new
	end
	def index
	  @chefs = Chef.paginate(page: params[:page], per_page: 4)
	end

  def create
  	@chef = Chef.new(chef_params)
  	if @chef.save
      session[:chef_id] = @chef.id
  		flash[:success] = "Bienvenu #{@chef.chefnom} dans RecettesPerso!"
  		redirect_to chef_path(@chef)
  	else
  		render 'new'
  	end
  end

  def show
    @chef_recettes = @chef.recettes.paginate(page: params[:page], per_page: 4)
  end

  def edit

  end

  def update
  	if @chef.update(chef_params)
  		flash[:success] = "Le profile de #{@chef.chefnom} a été mise à jour avec succes"
  		redirect_to chef_path(@chef)
  	else
  		render 'edit'
  	end
  end

  def destroy
    if !@chef.admin?
    @chef.destroy
    flash[:success] = "Le profile a été supprimé avec succès"
    redirect_to chefs_path
    end
  end 
  private
  	def init_chef
      @chef = Chef.find(params[:id])
    end
  	def chef_params
  		params.require(:chef).permit(:chefnom,:chefemail,:password,:password_confirmation)
  	end
    def require_same_user
      #COMPARAISON DES 2 OBJ, SESSION ET BASE
      if current_chef != @recipe.chef
        flash[:danger] = "You can only edit or delete your own recipes"
        redirect_to recipes_path
      end  
    end

end
