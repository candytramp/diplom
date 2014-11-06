require 'test_helper'

class AuthorRequestsControllerTest < ActionController::TestCase
  setup do
    @author_request = author_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_request" do
    assert_difference('AuthorRequest.count') do
      post :create, author_request: { details: @author_request.details, is_postgrad: @author_request.is_postgrad, is_staffteacher: @author_request.is_staffteacher, is_student: @author_request.is_student, is_teacher: @author_request.is_teacher, ois_request_id: @author_request.ois_request_id, old_lastname: @author_request.old_lastname, person_id: @author_request.person_id }
    end

    assert_redirected_to author_request_path(assigns(:author_request))
  end

  test "should show author_request" do
    get :show, id: @author_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author_request
    assert_response :success
  end

  test "should update author_request" do
    patch :update, id: @author_request, author_request: { details: @author_request.details, is_postgrad: @author_request.is_postgrad, is_staffteacher: @author_request.is_staffteacher, is_student: @author_request.is_student, is_teacher: @author_request.is_teacher, ois_request_id: @author_request.ois_request_id, old_lastname: @author_request.old_lastname, person_id: @author_request.person_id }
    assert_redirected_to author_request_path(assigns(:author_request))
  end

  test "should destroy author_request" do
    assert_difference('AuthorRequest.count', -1) do
      delete :destroy, id: @author_request
    end

    assert_redirected_to author_requests_path
  end
end
