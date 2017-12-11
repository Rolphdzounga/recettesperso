require 'test_helper'

class ChefSignupTest < ActionDispatch::IntegrationTest

	test "chemin signup existe - OK" do   

		get '/signup'
		assert_response :success
	end

	test "Refuser connexion - SUCCES" do   
	    get signup_path
	    assert_no_difference "Chef.count" do  
	      post chefs_path, params:{chef:{chefnom:"",chefemail:"", password:"",
	      											password_confirmation:"" }}
	      end
	    assert_template 'chefs/new'
	    assert_select 'h3>small'
	end

	test "Accepter connexion - SUCCES" do   
	    get signup_path
	    assert_difference "Chef.count" do  
	      post chefs_path, params:{chef:{chefnom:"cce",chefemail:"cce@gmail.com", password:"password",
	                                      password_confirmation:"password" }}
	      end
	    follow_redirect!
	    assert_template 'chefs/show'
	    assert_not flash.empty?
	end
end
