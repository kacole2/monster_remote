require 'test_helper'

class SinglescenesControllerTest < ActionController::TestCase
  setup do
    @singlescene = singlescenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:singlescenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create singlescene" do
    assert_difference('Singlescene.count') do
      post :create, singlescene: { slot: @singlescene.slot }
    end

    assert_redirected_to singlescene_path(assigns(:singlescene))
  end

  test "should show singlescene" do
    get :show, id: @singlescene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @singlescene
    assert_response :success
  end

  test "should update singlescene" do
    patch :update, id: @singlescene, singlescene: { slot: @singlescene.slot }
    assert_redirected_to singlescene_path(assigns(:singlescene))
  end

  test "should destroy singlescene" do
    assert_difference('Singlescene.count', -1) do
      delete :destroy, id: @singlescene
    end

    assert_redirected_to singlescenes_path
  end
end
