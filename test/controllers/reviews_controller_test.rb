require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get reviews_controller_url
    assert_response :success
  end
end
