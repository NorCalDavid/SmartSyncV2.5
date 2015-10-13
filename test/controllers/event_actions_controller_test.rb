require 'test_helper'

class EventActionsControllerTest < ActionController::TestCase
  setup do
    @event_action = event_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_action" do
    assert_difference('EventAction.count') do
      post :create, event_action: { action: @event_action.action, command_id: @event_action.command_id, description: @event_action.description, event_condition_id: @event_action.event_condition_id, executed_count: @event_action.executed_count, executed_last: @event_action.executed_last, execution_order: @event_action.execution_order, name: @event_action.name, published: @event_action.published, target_id: @event_action.target_id, test_option_id: @event_action.test_option_id, type: @event_action.type }
    end

    assert_redirected_to event_action_path(assigns(:event_action))
  end

  test "should show event_action" do
    get :show, id: @event_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_action
    assert_response :success
  end

  test "should update event_action" do
    patch :update, id: @event_action, event_action: { action: @event_action.action, command_id: @event_action.command_id, description: @event_action.description, event_condition_id: @event_action.event_condition_id, executed_count: @event_action.executed_count, executed_last: @event_action.executed_last, execution_order: @event_action.execution_order, name: @event_action.name, published: @event_action.published, target_id: @event_action.target_id, test_option_id: @event_action.test_option_id, type: @event_action.type }
    assert_redirected_to event_action_path(assigns(:event_action))
  end

  test "should destroy event_action" do
    assert_difference('EventAction.count', -1) do
      delete :destroy, id: @event_action
    end

    assert_redirected_to event_actions_path
  end
end
