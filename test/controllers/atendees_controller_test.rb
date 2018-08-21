require 'test_helper'

class AtendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get atendees_create_url
    assert_response :success
  end

end
