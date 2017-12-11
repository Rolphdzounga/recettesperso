class PagesController < ApplicationController
  def home
    redirect_to recettes_path if logged_in?
  end

  def index
    redirect_to recettes_path if logged_in?
  end

  def show
    render plain:"bonjour"
  end

  def new
    render plain:"bonjour"
  end

  def create
    render plain:"bonjour"
  end

  def edit
    render plain:"bonjour"
  end

  def update
    render plain:"bonjour"
  end

  def destroy
    render plain:"bonjour"
  end
end
