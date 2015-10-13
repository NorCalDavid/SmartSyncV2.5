require 'test_helper'

class EventConditionsControllerTest < ActionController::TestCase
  setup do
    @event_condition = event_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_condition" do
    assert_difference('EventCondition.count') do
      post :create, event_condition: { condition: @event_condition.condition, description: @event_condition.description, name: @event_condition.name, published: @event_condition.published, test_option_id: @event_condition.test_option_id, test_value_one: @event_condition.test_value_one, test_value_two: @event_condition.test_value_two, trigger_id: @event_condition.trigger_id, type: @event_condition.type }
    end

    assert_redirected_to event_condition_path(assigns(:event_condition))
  end

  test "should show event_condition" do
    get :show, id: @event_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_condition
    assert_response :success
  end

  test "should update event_condition" do
    patch :update, id: @event_condition, event_condition: { condition: @event_condition.condition, description: @event_condition.description, name: @event_condition.name, published: @event_condition.published, test_option_id: @event_condition.test_option_id, test_value_one: @event_condition.test_value_one, test_value_two: @event_condition.test_value_two, trigger_id: @event_condition.trigger_id, type: @event_condition.type }
    assert_redirected_to event_condition_path(assigns(:event_condition))
  end

  test "should destroy event_condition" do
    assert_difference('EventCondition.count', -1) do
      delete :destroy, id: @event_condition
    end

    assert_redirected_to event_conditions_path
  end
end
