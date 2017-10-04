require 'test_helper'

class RecetteSuppressionTest < ActionDispatch::IntegrationTest
	def setup
		@user = Chef.create! nomChef:"Boby2", email:"boby2@yahoo.fr"
		@recette = Recette.create nomR7:"Feuille de Manioc2", description:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user
	end

	test "Reussite Suppression recette " do
		#les verb declencher par le client sont: get, post, patch et delete
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
