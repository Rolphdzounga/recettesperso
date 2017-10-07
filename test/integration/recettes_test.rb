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
		#assert_match @recette1.nomR7, response.body
		assert_select "a[href=?]",recette_path(@recette1), text: @recette1.nomR7
		#assert_match @recette2.nomR7, response.body
		assert_select "a[href=?]",recette_path(@recette2), text: @recette2.nomR7

		
	end

	test "Afficher show page" do
		get recette_path(@recette2)
		assert_response :success
		assert_template 'recettes/show'
		assert_match @recette2.nomR7.upcase, response.body		
		assert_match @recette2.description, response.body
		#assert_match @user.nomChef, response.body
		assert_select "a[href=?]",edit_recette_path(@recette2), text: "Modifier"
		assert_select "a[href=?]",recette_path(@recette2), text: "Supprimer"
		assert_select "a[href=?]",recettes_path, text: "Liste des Recettes"
	end

	test "Valid page new recette" do
		get new_recette_path
	end

	test "Invalid page new recette" do
		get new_recette_path
	end

	test "doit rejeter la creation de la recette" do
		get new_recette_path
		assert_template 'recettes/new'
		assert_no_difference 'Recette.count' do
			post recettes_path, params:{recette:{nom:" ",description:" "}} 
		end
		get new_recette_path
		assert_template 'recettes/new'
		assert_select 'div.control-label'
		assert_select 'input.form-control'
	end

	test "doit valider la Creation de la Recette" do
		get new_recette_path
		assert_template 'recettes/new'
		nom_recette = "Gateau au chocolat"
		desc_recette = "ajouter farine + ajouter levure + ajouter beure + ajouter lait demi écrémé + "
		assert_difference 'Recette.count',1 do
			post recettes_path, params:{recette:{nomR7:nom_recette,description:desc_recette}}
		end
		follow_redirect!
		assert_match nom_recette.upcase,response.body
	end
end
