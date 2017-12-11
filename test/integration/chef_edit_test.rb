require 'test_helper'

class ChefEditTest < ActionDispatch::IntegrationTest
	def setup
		@chef = Chef.create! chefnom:"Boby", chefemail:"boby@yahoo.fr",
		           password:"password", password_confirmation:"password"
		@recette1 = Recette.create recettenom:"Feuille de Manioc2", recettedesc:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user
		@recette2 = @chef.recettes.build  recettenom:"Omelette", recettedesc:"oeuf + oignon + huile + sel..."
		@recette2.save
	end

	test "chemin chef edit - SUCCES"  do   
		get edit_chef_path @chef
		assert_response :success
	end

	test "invalid maj - ECHEC"  do 
		sign_in_as(@chef, "password")  
		get edit_chef_path @chef
		assert_template 'chefs/edit'
		patch chef_path @chef,params:{chef:{chefnom:"",chefemail:"boby@yahoo.fr",password:"",password_confirmation:""}}
		assert_template 'chefs/edit'
		assert_select 'p.badge-danger'
	end

	test "valid maj - SUCCES"  do   
		sign_in_as(@chef, "password")
		get edit_chef_path @chef
		assert_template 'chefs/edit'
		patch chef_path @chef,params:{chef:{chefnom:"test",chefemail:"test@yahoo.fr",password:"123456",password_confirmation:"123456"}}
		assert_redirected_to @chef
		assert_not flash.empty?
		@chef.reload
		assert_match 'test',@chef.chefnom
	end
end
