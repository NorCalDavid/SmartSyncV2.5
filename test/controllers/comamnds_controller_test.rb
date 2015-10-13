require 'test_helper'

class ComamndsControllerTest < ActionController::TestCase
  setup do
    @comamnd = comamnds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comamnds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comamnd" do
    assert_difference('Comamnd.count') do
      post :create, comamnd: { description: @comamnd.description, endpoint: @comamnd.endpoint, name: @comamnd.name, resource: @comamnd.resource, type: @comamnd.type }
    end

    assert_redirected_to comamnd_path(assigns(:comamnd))
  end

  test "should show comamnd" do
    get :show, id: @comamnd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comamnd
    assert_response :success
  end

  test "should update comamnd" do
    patch :update, id: @comamnd, comamnd: { description: @comamnd.description, endpoint: @comamnd.endpoint, name: @comamnd.name, resource: @comamnd.resource, type: @comamnd.type }
    assert_redirected_to comamnd_path(assigns(:comamnd))
  end

  test "should destroy comamnd" do
    assert_difference('Comamnd.count', -1) do
      delete :destroy, id: @comamnd
    end

    assert_redirected_to comamnds_path
  end
end
