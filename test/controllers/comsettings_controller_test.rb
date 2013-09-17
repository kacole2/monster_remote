require 'test_helper'

class ComsettingsControllerTest < ActionController::TestCase
  setup do
    @comsetting = comsettings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comsettings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comsetting" do
    assert_difference('Comsetting.count') do
      post :create, comsetting: { baud: @comsetting.baud, comport: @comsetting.comport }
    end

    assert_redirected_to comsetting_path(assigns(:comsetting))
  end

  test "should show comsetting" do
    get :show, id: @comsetting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comsetting
    assert_response :success
  end

  test "should update comsetting" do
    patch :update, id: @comsetting, comsetting: { baud: @comsetting.baud, comport: @comsetting.comport }
    assert_redirected_to comsetting_path(assigns(:comsetting))
  end

  test "should destroy comsetting" do
    assert_difference('Comsetting.count', -1) do
      delete :destroy, id: @comsetting
    end

    assert_redirected_to comsettings_path
  end
end
