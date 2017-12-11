require 'test_helper'

class ChefsListingTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create! chefnom:"Boby", chefemail:"boby@yahoo.fr",
               password:"password", password_confirmation:"password"
    @chef2 = Chef.create! chefnom:"dady", chefemail:"dady@yahoo.fr",
               password:"password", password_confirmation:"password"
  end
  
  test "should get chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefnom.capitalize
    #assert_select "a[href=?]", chef_path(@chef2), text: @chef2.nomChef.capitalize
  end

 test "should delete chef" do
 	sign_in_as(@chef, "password")
    get chefs_path
    assert_template 'chefs/index'
    assert_no_difference 'Chef.count', -1 do
      delete chef_path(@chef2)
    end
    # assert_redirected_to chefs_path
    assert_not flash.empty?
  end
end
