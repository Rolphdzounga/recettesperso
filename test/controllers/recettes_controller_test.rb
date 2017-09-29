require 'test_helper'

class RecettesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recettes_index_url
    assert_response :success
  end

  test "should get new" do
    get recettes_new_url
    assert_response :success
  end



  test "should get edit" do
    get recettes_edit_url
    assert_response :success
  end




end
