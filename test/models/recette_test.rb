require 'test_helper'

class RecetteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @recipe = Recette.new(recettenom: "vegetable", recettedesc: "great vegetable recipe")  
  end
  
  test "recipe should be valid" do
    assert_not @recipe.valid?
  end  
  
  test "recettenom should be present" do
    @recipe.recettenom = " "
    assert_not @recipe.valid?
  end
  
  test "recettedesc should be present" do
    @recipe.recettedesc = " "
    assert_not @recipe.valid?
  end
  
  test "recettedesc shouldn't be less than 5 characters" do
    @recipe.recettedesc = "a" * 3
    assert_not @recipe.valid?
  end
  
  test "recettedesc shouldn't be more than 500 characters" do
    @recipe.recettedesc = "a" * 501
    assert_not @recipe.valid?
  end


end
