require 'test_helper'

class ScheduleActionsControllerTest < ActionController::TestCase
  setup do
    @schedule_action = schedule_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_action" do
    assert_difference('ScheduleAction.count') do
      post :create, schedule_action: { action: @schedule_action.action, command_id: @schedule_action.command_id, description: @schedule_action.description, executed_count: @schedule_action.executed_count, executed_last: @schedule_action.executed_last, name: @schedule_action.name, published: @schedule_action.published, published_on: @schedule_action.published_on, schedule_id: @schedule_action.schedule_id, status: @schedule_action.status, target_id: @schedule_action.target_id, type: @schedule_action.type }
    end

    assert_redirected_to schedule_action_path(assigns(:schedule_action))
  end

  test "should show schedule_action" do
    get :show, id: @schedule_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_action
    assert_response :success
  end

  test "should update schedule_action" do
    patch :update, id: @schedule_action, schedule_action: { action: @schedule_action.action, command_id: @schedule_action.command_id, description: @schedule_action.description, executed_count: @schedule_action.executed_count, executed_last: @schedule_action.executed_last, name: @schedule_action.name, published: @schedule_action.published, published_on: @schedule_action.published_on, schedule_id: @schedule_action.schedule_id, status: @schedule_action.status, target_id: @schedule_action.target_id, type: @schedule_action.type }
    assert_redirected_to schedule_action_path(assigns(:schedule_action))
  end

  test "should destroy schedule_action" do
    assert_difference('ScheduleAction.count', -1) do
      delete :destroy, id: @schedule_action
    end

    assert_redirected_to schedule_actions_path
  end
end
