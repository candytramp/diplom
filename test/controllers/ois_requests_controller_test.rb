require 'test_helper'

class OisRequestsControllerTest < ActionController::TestCase
  setup do
    @ois_request = ois_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ois_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ois_request" do
    assert_difference('OisRequest.count') do
      post :create, ois_request: { author: @ois_request.author, creator_data: @ois_request.creator_data, creator_login: @ois_request.creator_login, name: @ois_request.name, number: @ois_request.number, object: @ois_request.object, priority: @ois_request.priority, reg_agency: @ois_request.reg_agency, research_effort_id: @ois_request.research_effort_id, status: @ois_request.status }
    end

    assert_redirected_to ois_request_path(assigns(:ois_request))
  end

  test "should show ois_request" do
    get :show, id: @ois_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ois_request
    assert_response :success
  end

  test "should update ois_request" do
    patch :update, id: @ois_request, ois_request: { author: @ois_request.author, creator_data: @ois_request.creator_data, creator_login: @ois_request.creator_login, name: @ois_request.name, number: @ois_request.number, object: @ois_request.object, priority: @ois_request.priority, reg_agency: @ois_request.reg_agency, research_effort_id: @ois_request.research_effort_id, status: @ois_request.status }
    assert_redirected_to ois_request_path(assigns(:ois_request))
  end

  test "should destroy ois_request" do
    assert_difference('OisRequest.count', -1) do
      delete :destroy, id: @ois_request
    end

    assert_redirected_to ois_requests_path
  end
end
