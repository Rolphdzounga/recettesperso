class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#DECLARATION DES METH GLOB DE CNX
helper_method :current_chef, :logged_in?

#METHOD GLOBALE QUI RENVOI LE CHEF CONNECTE
def current_chef
#SESSION EST UNE VAR PIVOT
#RENSEIGNER QUAND UN USER SE CONNECTE
#A PARTIR DE L'OBJET :session du form de connexion
@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
end
#METHOD GLOBALE DE VERIF CNX
def logged_in?
!!current_chef
end
#METHOD GLOBALE, EXIT QD LA CNX ECHOUE 
def require_user
	if !logged_in?
	flash[:danger] = "You must be logged in to perform that action"
	redirect_to root_path
	end
end
#METHOD GLOBALE, EXIT QD LA CNX ECHOUE OU LE LE CONNECTE N'EST PAS ADMIN
	def require_admin
	  if logged_in? & !current_chef.admin?
	  flash[:danger] = "Only admin users can perform that action"
	  redirect_to root_path
	  end
	end
end
