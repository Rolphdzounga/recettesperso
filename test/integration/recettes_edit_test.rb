require 'test_helper'

class RecettesEditTest < ActionDispatch::IntegrationTest
	def setup
		@user1 = Chef.create! nomChef:"Boby2", email:"boby2@yahoo.fr"
		@recette3 = Recette.create nomR7:"Feuille de Manioc2", description:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user1
	end

	test "Rejet maj invalide" do 
		get edit_recette_path(@recette3) #Affiche Page
		assert_template 'recettes/edit' #Est-ce-que Page?
		#Mets à jour la donnée X avec les valeurs Y,Z
		patch recette_path(@recette3), params:{recette:{nomR7:" ",description:"Une description est renseignée ICI!!!"}}
		#Est-ce-que Page?
		assert_template 'recettes/edit'
		#Est-que un tel elmt dans le body de la Page???
		#assert_select "div.alert",response.body
	end

	test "maj Recette valide" do 
		get edit_recette_path @recette3
		assert_template 'recettes/edit'
		updt_nom = "Nom recette Mise à jour"
		updt_desc = "Description recette Mise à jour"
		#Envoyer Maj 
		patch recette_path(@recette3), params:{recette:{nomR7:updt_nom,description:updt_desc}}
		#Verif Action redirected_to
		assert_redirected_to @recette3
		#follow_redirect!
		assert_not flash.empty?
		@recette3.reload
		assert_match updt_nom,@recette3.nomR7
		assert_match updt_desc,@recette3.description

		
	end
end
