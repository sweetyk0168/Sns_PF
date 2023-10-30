require "test_helper"

class Admin::EventQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_questionnaires_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_questionnaires_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_questionnaires_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_questionnaires_show_url
    assert_response :success
  end
end
