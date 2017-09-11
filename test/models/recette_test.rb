require 'test_helper'

class RecetteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @recipe = Recette.new(nomR7: "vegetable", description: "great vegetable recipe")  
  end
  
  test "recipe should be valid" do
    assert_not @recipe.valid?
  end  
  
  test "nomR7 should be present" do
    @recipe.nomR7 = " "
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end
  
  test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end


end
