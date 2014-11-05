require 'test_helper'

class DiplomaPeopleControllerTest < ActionController::TestCase
  setup do
    @diploma_person = diploma_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diploma_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diploma_person" do
    assert_difference('DiplomaPerson.count') do
      post :create, diploma_person: { details: @diploma_person.details, diploma_id: @diploma_person.diploma_id, is_postgrad: @diploma_person.is_postgrad, is_staffteacher: @diploma_person.is_staffteacher, is_student: @diploma_person.is_student, is_teacher: @diploma_person.is_teacher, old_lastname: @diploma_person.old_lastname, person_id: @diploma_person.person_id }
    end

    assert_redirected_to diploma_person_path(assigns(:diploma_person))
  end

  test "should show diploma_person" do
    get :show, id: @diploma_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diploma_person
    assert_response :success
  end

  test "should update diploma_person" do
    patch :update, id: @diploma_person, diploma_person: { details: @diploma_person.details, diploma_id: @diploma_person.diploma_id, is_postgrad: @diploma_person.is_postgrad, is_staffteacher: @diploma_person.is_staffteacher, is_student: @diploma_person.is_student, is_teacher: @diploma_person.is_teacher, old_lastname: @diploma_person.old_lastname, person_id: @diploma_person.person_id }
    assert_redirected_to diploma_person_path(assigns(:diploma_person))
  end

  test "should destroy diploma_person" do
    assert_difference('DiplomaPerson.count', -1) do
      delete :destroy, id: @diploma_person
    end

    assert_redirected_to diploma_people_path
  end
end
