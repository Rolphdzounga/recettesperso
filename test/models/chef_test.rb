require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@chef = Chef.new nomChef:"DZOUNGA ANDREW DAVID", email:"dad@gmail.com"
  end

  test "nouvel objet valid" do
  	assert @chef.valid?
  end
  test "check format email" do
  	@chef.email="andew.com"
  	assert_not @chef.valid?
  end
  test "le mail en minuscule avant la sauv en base" do
  	mailtest = "EmmaNuella@yahOo.com"
  	@chef.email=mailtest
  	@chef.save
  	assert_equal mailtest.downcase,@chef.reload.email
  end
end
