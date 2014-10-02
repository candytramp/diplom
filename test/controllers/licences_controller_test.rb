require 'test_helper'

class LicencesControllerTest < ActionController::TestCase
  setup do
    @licence = licences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licence" do
    assert_difference('Licence.count') do
      post :create, licence: { expiration_date: @licence.expiration_date, name: @licence.name, number: @licence.number, reg_agency: @licence.reg_agency, reg_date: @licence.reg_date, req_author: @licence.req_author, req_number: @licence.req_number, req_object: @licence.req_object, req_priority: @licence.req_priority, req_status: @licence.req_status, reseff_name: @licence.reseff_name, support: @licence.support, type: @licence.type }
    end

    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should show licence" do
    get :show, id: @licence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licence
    assert_response :success
  end

  test "should update licence" do
    patch :update, id: @licence, licence: { expiration_date: @licence.expiration_date, name: @licence.name, number: @licence.number, reg_agency: @licence.reg_agency, reg_date: @licence.reg_date, req_author: @licence.req_author, req_number: @licence.req_number, req_object: @licence.req_object, req_priority: @licence.req_priority, req_status: @licence.req_status, reseff_name: @licence.reseff_name, support: @licence.support, type: @licence.type }
    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should destroy licence" do
    assert_difference('Licence.count', -1) do
      delete :destroy, id: @licence
    end

    assert_redirected_to licences_path
  end
end
