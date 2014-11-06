require 'test_helper'

class AuthorMonographsControllerTest < ActionController::TestCase
  setup do
    @author_monograph = author_monographs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_monographs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_monograph" do
    assert_difference('AuthorMonograph.count') do
      post :create, author_monograph: { details: @author_monograph.details, is_postgrad: @author_monograph.is_postgrad, is_staffteacher: @author_monograph.is_staffteacher, is_student: @author_monograph.is_student, is_teacher: @author_monograph.is_teacher, monograph_id: @author_monograph.monograph_id, old_lastname: @author_monograph.old_lastname, pages: @author_monograph.pages, person_id: @author_monograph.person_id }
    end

    assert_redirected_to author_monograph_path(assigns(:author_monograph))
  end

  test "should show author_monograph" do
    get :show, id: @author_monograph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author_monograph
    assert_response :success
  end

  test "should update author_monograph" do
    patch :update, id: @author_monograph, author_monograph: { details: @author_monograph.details, is_postgrad: @author_monograph.is_postgrad, is_staffteacher: @author_monograph.is_staffteacher, is_student: @author_monograph.is_student, is_teacher: @author_monograph.is_teacher, monograph_id: @author_monograph.monograph_id, old_lastname: @author_monograph.old_lastname, pages: @author_monograph.pages, person_id: @author_monograph.person_id }
    assert_redirected_to author_monograph_path(assigns(:author_monograph))
  end

  test "should destroy author_monograph" do
    assert_difference('AuthorMonograph.count', -1) do
      delete :destroy, id: @author_monograph
    end

    assert_redirected_to author_monographs_path
  end
end
