require 'test_helper'

class StatusOptionsControllerTest < ActionController::TestCase
  setup do
    @status_option = status_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_option" do
    assert_difference('StatusOption.count') do
      post :create, status_option: {  }
    end

    assert_redirected_to status_option_path(assigns(:status_option))
  end

  test "should show status_option" do
    get :show, id: @status_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_option
    assert_response :success
  end

  test "should update status_option" do
    patch :update, id: @status_option, status_option: {  }
    assert_redirected_to status_option_path(assigns(:status_option))
  end

  test "should destroy status_option" do
    assert_difference('StatusOption.count', -1) do
      delete :destroy, id: @status_option
    end

    assert_redirected_to status_options_path
  end
end
