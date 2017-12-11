require 'test_helper'

class ChefsLoginTest < ActionDispatch::IntegrationTest
 def setup
    @chef = Chef.create! chefnom:"Boby", chefemail:"boby@yahoo.fr",
               password:"password", password_confirmation:"password"
  end
  
  test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { chefemail: " ", 
                                              password: " " } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "valid login credentials accepted and begin session" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { chefemail: @chef.chefemail, 
                                    password: @chef.password } }
    assert_redirected_to @chef
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
  end
end
