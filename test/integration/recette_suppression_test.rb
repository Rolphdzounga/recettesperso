require 'test_helper'

class RecetteSuppressionTest < ActionDispatch::IntegrationTest
	def setup
		@user = Chef.create! chefnom:"Boby2", chefemail:"boby2@yahoo.fr",
		        password:"password", password_confirmation:"password"
		@recette = Recette.create recettenom:"Feuille de Manioc2", recettedesc:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user
	end

	test "Reussite Suppression recette " do
		#les verb declencher par le client sont: get, post, patch et delete
		sign_in_as(@user, "password")
		get recette_path(@recette) 
		assert_template "recettes/show"
		assert_select "a[href=?]",recette_path(@recette),text:"Supprimer"
		assert_difference 'Recette.count', -1 do 
			delete recette_path(@recette)
		end
		assert_redirected_to recettes_path
		assert_not flash.empty?
	end
end
