require 'test_helper'

class RecettesTest < ActionDispatch::IntegrationTest
	def setup
		@user = Chef.create! chefnom:"Boby2", chefemail:"boby2@yahoo.fr",
		        password:"password", password_confirmation:"password"
		@recette1 = Recette.create recettenom:"Feuille de Manioc2", recettedesc:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user
		@recette2 = @user.recettes.build  recettenom:"Omelette", recettedesc:"oeuf + oignon + huile + sel...", chef:@user
		@recette2.save	

	end



	test "la page index de :recettes est là" do
		get recettes_url
		assert_response :success
	end

	test "Afficher la Liste des Recettes" do
		get recettes_url
		assert_template 'recettes/index'
		assert_match @recette1.recettenom, response.body
		assert_select "a[href=?]",recette_path(@recette1), text: @recette1.recettenom
		#assert_match @recette2.recettenom, response.body
		#assert_select "a[href=?]",recette_path(@recette2), text: @recette2.recettenom

		
	end

	test "Afficher show page" do
		get recette_path(@recette2)
		assert_response :success
		assert_template 'recettes/show'
		assert_match @recette2.recettenom.upcase, response.body		
		assert_match @recette2.recettedesc, response.body
		#assert_match @user.nomChef, response.body
		# assert_select "a[href=?]",edit_recette_path(@recette2), text: "Modifier"
		# assert_select "a[href=?]",recette_path(@recette2), text: "Supprimer"
		assert_select "a[href=?]",recettes_path, text: "Liste des Recettes"
	end

	test "Valid page new recette" do
		get new_recette_path
	end

	test "Invalid page new recette" do
		get new_recette_path
	end

	test "doit rejeter la creation de la recette" do
		sign_in_as(@user, "password")
		get new_recette_path
		assert_template 'recettes/new'
		assert_no_difference 'Recette.count' do
			post recettes_path, params:{recette:{nom:" ",recettedesc:" "}} 
		end
		get new_recette_path
		assert_template 'recettes/new'
		assert_select 'div.control-label'
		assert_select 'input.form-control'
	end

	test "doit valider la Creation de la Recette" do
		sign_in_as(@user, "password")
		get new_recette_path
		assert_template 'recettes/new'
		nom_recette = "Gateau au chocolat"
		desc_recette = "ajouter farine + ajouter levure + ajouter beure + ajouter lait demi écrémé + "
		assert_difference 'Recette.count',1 do
			post recettes_path, params:{recette:{recettenom:nom_recette,recettedesc:desc_recette}}
		end
		follow_redirect!
		assert_match nom_recette.upcase,response.body
	end
end
