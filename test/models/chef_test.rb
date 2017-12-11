require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@chef = Chef.new chefnom:"DZOUNGA ANDREW DAVID", chefemail:"dad@gmail.com",
                              password:"password", password_confirmation:"password"
  end

  test "nouvel objet valid" do
  	assert @chef.valid?
  end
  test "check format chefemail" do
  	@chef.chefemail="andew.com"
  	assert_not @chef.valid?
  end
  test "le mail en minuscule avant la sauv en base" do
  	mailtest = "EmmaNuella@yahOo.com"
  	@chef.chefemail=mailtest
  	@chef.save
  	assert_equal mailtest.downcase,@chef.reload.chefemail
  end

  test "presence password SUCCES" do   

    @chef.password = @chef.password_confirmation = " "

    assert_not @chef.valid?
  end

  test "Longeur mini = 5 caractères - SUCCES" do   

    @chef.password = @chef.password_confirmation = "x"

    assert_not @chef.valid?
  end

  # test "associated recettes should be destroyed" do
  #   @chef.save
  #   @chef.recettes.create!(recettenom: "testing delete", 
  #                   recettedesc: "testing delete function")
  #   assert_difference 'Recette.count', -1 do
  #     @chef.destroy
  #   end
  # end

end
