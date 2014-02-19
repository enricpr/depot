require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
	assert_select '.posts .post', 3
	assert_select 'h3', 'McFarlane NBA Figure #1 Allen Iverson'
	assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
