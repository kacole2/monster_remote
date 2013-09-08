require 'test_helper'

class RasberryPisControllerTest < ActionController::TestCase
  setup do
    @rasberry_pi = rasberry_pis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rasberry_pis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rasberry_pi" do
    assert_difference('RasberryPi.count') do
      post :create, rasberry_pi: { ipdns: @rasberry_pi.ipdns, password: @rasberry_pi.password, username: @rasberry_pi.username }
    end

    assert_redirected_to rasberry_pi_path(assigns(:rasberry_pi))
  end

  test "should show rasberry_pi" do
    get :show, id: @rasberry_pi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rasberry_pi
    assert_response :success
  end

  test "should update rasberry_pi" do
    patch :update, id: @rasberry_pi, rasberry_pi: { ipdns: @rasberry_pi.ipdns, password: @rasberry_pi.password, username: @rasberry_pi.username }
    assert_redirected_to rasberry_pi_path(assigns(:rasberry_pi))
  end

  test "should destroy rasberry_pi" do
    assert_difference('RasberryPi.count', -1) do
      delete :destroy, id: @rasberry_pi
    end

    assert_redirected_to rasberry_pis_path
  end
end
