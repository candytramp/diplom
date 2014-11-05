require 'test_helper'

class MonographAuthorsControllerTest < ActionController::TestCase
  setup do
    @monograph_author = monograph_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monograph_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monograph_author" do
    assert_difference('MonographAuthor.count') do
      post :create, monograph_author: { details: @monograph_author.details, is_postgrad: @monograph_author.is_postgrad, is_staffteacher: @monograph_author.is_staffteacher, is_student: @monograph_author.is_student, is_teacher: @monograph_author.is_teacher, monograph_id: @monograph_author.monograph_id, old_lastname: @monograph_author.old_lastname, pages: @monograph_author.pages, person_id: @monograph_author.person_id }
    end

    assert_redirected_to monograph_author_path(assigns(:monograph_author))
  end

  test "should show monograph_author" do
    get :show, id: @monograph_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monograph_author
    assert_response :success
  end

  test "should update monograph_author" do
    patch :update, id: @monograph_author, monograph_author: { details: @monograph_author.details, is_postgrad: @monograph_author.is_postgrad, is_staffteacher: @monograph_author.is_staffteacher, is_student: @monograph_author.is_student, is_teacher: @monograph_author.is_teacher, monograph_id: @monograph_author.monograph_id, old_lastname: @monograph_author.old_lastname, pages: @monograph_author.pages, person_id: @monograph_author.person_id }
    assert_redirected_to monograph_author_path(assigns(:monograph_author))
  end

  test "should destroy monograph_author" do
    assert_difference('MonographAuthor.count', -1) do
      delete :destroy, id: @monograph_author
    end

    assert_redirected_to monograph_authors_path
  end
end
