require "test_helper"

class Customer::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_events_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_events_show_url
    assert_response :success
  end
end
