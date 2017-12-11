class SessionsController < ApplicationController 
  def new
  # will simply render the form
  end
  def create
  # will create the session and move the user to logged in state
  #debugger
    #TROUVER LE CHEF QUI A CE MAIL
    chef = Chef.find_by(chefemail: params[:session][:chefemail].downcase)
    #AUTHENTIFIER LE CHEF QUI AVEC CE PWD
    if chef && chef.authenticate(params[:session][:password])
      #RENSEIGNER LA VAR PIVOT OU GLOBALE
      session[:chef_id] = chef.id
      flash[:success] = "You have successfully logged in"
      redirect_to chef
    else
    flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end 