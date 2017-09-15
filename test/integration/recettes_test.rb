require 'test_helper'

class RecettesTest < ActionDispatch::IntegrationTest
	def setup
		@user = Chef.create! nomChef:"Boby", email:"boby@yahoo.fr"
		@recette1 = Recette.create nomR7:"Feuille de Manioc", description:"Feuille de Manioc + huile + oignon + boite sardine...", chef:@user
		@recette2 = @user.recettes.build nomR7:"Omelette", description:"oeuf + oignon + huile + sel..."
		@recette2.save	
	end
	test "la page index de :recettes est là" do
		get recettes_url
		assert_response :success
	end

	test "Afficher la Liste des Recettes" do
		get recettes_url
		assert_template 'recettes/index'
		assert_match @recette1.nomR7, response.body
		assert_match @recette2.nomR7, response.body
	end
end
