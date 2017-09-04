require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

	test "page/home existe" do
		get pages_home_url
		assert_response :success
	end

	test "page root existe" do
		get root_url
		assert_response :success
	end
	test "new_pages_url existe" do
		get pages_new_url
		assert_response :success
	end
end
