require 'test_helper'

class NirTypesControllerTest < ActionController::TestCase
  setup do
    @nir_type = nir_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nir_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nir_type" do
    assert_difference('NirType.count') do
      post :create, nir_type: { name: @nir_type.name }
    end

    assert_redirected_to nir_type_path(assigns(:nir_type))
  end

  test "should show nir_type" do
    get :show, id: @nir_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nir_type
    assert_response :success
  end

  test "should update nir_type" do
    patch :update, id: @nir_type, nir_type: { name: @nir_type.name }
    assert_redirected_to nir_type_path(assigns(:nir_type))
  end

  test "should destroy nir_type" do
    assert_difference('NirType.count', -1) do
      delete :destroy, id: @nir_type
    end

    assert_redirected_to nir_types_path
  end
end
