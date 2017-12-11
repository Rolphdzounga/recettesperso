class CommentairesController < ApplicationController
  before_action :set_commentaire, only: [:show, :edit, :update, :destroy]

  # GET /commentaires
  # GET /commentaires.json
  def index
    @commentaires = Commentaire.all
  end

  # GET /commentaires/1
  # GET /commentaires/1.json
  def show
  
  end

  # GET /commentaires/new
  def new
    @commentaire = Commentaire.new
  end

  # GET /commentaires/1/edit
  def edit
  end

  # POST /commentaires
  # POST /commentaires.json
  def create
    @recette = Recette.find(params[:recette_id]) 
    
    @commentaire = @recette.commentaires.build(commentaire_params)

    @commentaire.chef =  current_chef
    
      if @commentaire.save      
        flash[:success] = "Le  Commentaire a été créér avec succès!!!"
        redirect_to recette_path @recette
      else
        flash[:danger] = "Commentaire was not created"
        redirect_to :back
      end
    
  end

  # PATCH/PUT /commentaires/1
  # PATCH/PUT /commentaires/1.json
  def update
    respond_to do |format|
      if @commentaire.update(commentaire_params)
        format.html { redirect_to @commentaire, notice: 'Commentaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @commentaire }
      else
        format.html { render :edit }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaires/1
  # DELETE /commentaires/1.json
  def destroy
    @commentaire.destroy
    respond_to do |format|
      format.html { redirect_to commentaires_url, notice: 'Commentaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentaire_params
      params.require(:commentaire).permit(:commentairetexte)
    end
end
