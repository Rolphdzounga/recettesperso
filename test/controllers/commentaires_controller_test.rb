# require 'test_helper'

# class CommentairesControllerTest < ActionDispatch::IntegrationTest
#   def setup
#   	@chef = Chef.create!(nomChef: "mashrur", email: "mashrur@example.com",
#                     password: "password", password_confirmation: "password")

#   	@recette = Recette.create nomR7:"Feuille de Manioc2", description:"Feuille de Manioc + huile + oignon + boite sardine...2", chef:@user1

#     # @commentaire = commentaires(:one)

#     @commentaire1 = Commentaire.create desc_com:"un ptit commentaire...",chef:@chef,recette:@recette
#   end

#   test "should get index" do
#     get commentaires_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_commentaire_url
#     assert_response :success
#   end

#   test "should create commentaire" do
#     assert_difference('Commentaire.count') do
#       post commentaires_url, params: { commentaire: {  desc_com: "ceci est un ptit commentaire",chef: @chef, recette: @recette } }
#     end

#     assert_redirected_to commentaire_url(Commentaire.last)
#   end

#   test "should show commentaire" do
#     get commentaire_path(@commentaire1)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_commentaire_path(@commentaire1)
#     assert_response :success
#   end

#   # test "should update commentaire" do
  																
#   #   patch commentaire_url(@commentaire), params: { commentaire: { chef: @commentaire.chef, desc_com: @commentaire.desc_com, recette: @commentaire.recette } }
#   #   assert_redirected_to commentaire_url(@commentaire)
#   # end

#   # test "should destroy commentaire" do
#   #   assert_difference('Commentaire.count', -1) do
#   #     delete commentaire_url(@commentaire)
#   #   end

#   #   assert_redirected_to commentaires_url
#   # end
# end
