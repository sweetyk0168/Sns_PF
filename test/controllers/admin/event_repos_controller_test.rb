require "test_helper"

class Admin::EventReposControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_repos_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_repos_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_repos_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_repos_show_url
    assert_response :success
  end
end
