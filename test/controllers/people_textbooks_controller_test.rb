require 'test_helper'

class PeopleTextbooksControllerTest < ActionController::TestCase
  setup do
    @people_textbook = people_textbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_textbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_textbook" do
    assert_difference('PeopleTextbook.count') do
      post :create, people_textbook: { details: @people_textbook.details, is_postgrad: @people_textbook.is_postgrad, is_staffteacher: @people_textbook.is_staffteacher, is_student: @people_textbook.is_student, is_teacher: @people_textbook.is_teacher, old_lastname: @people_textbook.old_lastname, person_id: @people_textbook.person_id, textbook_id: @people_textbook.textbook_id }
    end

    assert_redirected_to people_textbook_path(assigns(:people_textbook))
  end

  test "should show people_textbook" do
    get :show, id: @people_textbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_textbook
    assert_response :success
  end

  test "should update people_textbook" do
    patch :update, id: @people_textbook, people_textbook: { details: @people_textbook.details, is_postgrad: @people_textbook.is_postgrad, is_staffteacher: @people_textbook.is_staffteacher, is_student: @people_textbook.is_student, is_teacher: @people_textbook.is_teacher, old_lastname: @people_textbook.old_lastname, person_id: @people_textbook.person_id, textbook_id: @people_textbook.textbook_id }
    assert_redirected_to people_textbook_path(assigns(:people_textbook))
  end

  test "should destroy people_textbook" do
    assert_difference('PeopleTextbook.count', -1) do
      delete :destroy, id: @people_textbook
    end

    assert_redirected_to people_textbooks_path
  end
end
