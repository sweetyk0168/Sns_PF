require "test_helper"

class Public::EventReposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_event_repos_index_url
    assert_response :success
  end

  test "should get show" do
    get public_event_repos_show_url
    assert_response :success
  end
end
