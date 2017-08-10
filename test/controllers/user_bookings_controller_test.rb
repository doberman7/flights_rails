require 'test_helper'

class UserBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_bookings_index_url
    assert_response :success
  end

end
