require 'test_helper'

class GrntisControllerTest < ActionController::TestCase
  setup do
    @grnti = grntis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grntis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grnti" do
    assert_difference('Grnti.count') do
      post :create, grnti: { grnti: @grnti.grnti, name: @grnti.name }
    end

    assert_redirected_to grnti_path(assigns(:grnti))
  end

  test "should show grnti" do
    get :show, id: @grnti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grnti
    assert_response :success
  end

  test "should update grnti" do
    patch :update, id: @grnti, grnti: {grnti: @grnti.grnti, name: @grnti.name }
    assert_redirected_to grnti_path(assigns(:grnti))
  end

  test "should destroy grnti" do
    assert_difference('Grnti.count', -1) do
      delete :destroy, id: @grnti
    end

    assert_redirected_to grntis_path
  end
end
