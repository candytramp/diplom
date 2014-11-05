require 'test_helper'

class RequestAuthorsControllerTest < ActionController::TestCase
  setup do
    @request_author = request_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_author" do
    assert_difference('RequestAuthor.count') do
      post :create, request_author: { details: @request_author.details, is_postgrad: @request_author.is_postgrad, is_staffteacher: @request_author.is_staffteacher, is_student: @request_author.is_student, is_teacher: @request_author.is_teacher, ois_request_id: @request_author.ois_request_id, old_lastname: @request_author.old_lastname, person_id: @request_author.person_id }
    end

    assert_redirected_to request_author_path(assigns(:request_author))
  end

  test "should show request_author" do
    get :show, id: @request_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_author
    assert_response :success
  end

  test "should update request_author" do
    patch :update, id: @request_author, request_author: { details: @request_author.details, is_postgrad: @request_author.is_postgrad, is_staffteacher: @request_author.is_staffteacher, is_student: @request_author.is_student, is_teacher: @request_author.is_teacher, ois_request_id: @request_author.ois_request_id, old_lastname: @request_author.old_lastname, person_id: @request_author.person_id }
    assert_redirected_to request_author_path(assigns(:request_author))
  end

  test "should destroy request_author" do
    assert_difference('RequestAuthor.count', -1) do
      delete :destroy, id: @request_author
    end

    assert_redirected_to request_authors_path
  end
end
