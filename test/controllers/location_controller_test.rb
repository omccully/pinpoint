require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get location_create_url
    assert_response :success
  end

end
