require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest
	def setup
		@chef = Chef.create! chefnom:"Boby", chefemail:"boby@yahoo.fr",
		           password:"password", password_confirmation:"password"

		@user = Chef.create! chefnom:"Boby2", chefemail:"boby2@yahoo.fr",
		        password:"password", password_confirmation:"password"
		@recette1 = Recette.create recettenom:"Feuille de Manioc2", recettedesc:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user
		@recette2 = @user.recettes.build  recettenom:"Omelette", recettedesc:"oeuf + oignon + huile + sel...", chef:@user
		@recette2.save	
	end

	test "afficher Page Chef Show -- SUCCESS" do   
		get chef_path(@chef)
		assert_template 'chefs/show'
		assert_select 'a[href=?]',recette_path(@recette1), text:@recette1.recettenom
		assert_select 'a[href=?]',recette_path(@recette2), text:@recette2.recettenom
		assert_match @recette1.description.truncate(5) , response.body
		assert_match @recette2.description.truncate(5) , response.body
		assert_match @chef.chefnom,response.body
	end
end
