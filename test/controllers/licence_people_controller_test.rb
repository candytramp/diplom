require 'test_helper'

class LicencePeopleControllerTest < ActionController::TestCase
  setup do
    @licence_person = licence_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licence_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licence_person" do
    assert_difference('LicencePerson.count') do
      post :create, licence_person: { details: @licence_person.details, is_postgrad: @licence_person.is_postgrad, is_staffteacher: @licence_person.is_staffteacher, is_student: @licence_person.is_student, is_teacher: @licence_person.is_teacher, licence_id: @licence_person.licence_id, old_lastname: @licence_person.old_lastname, person_id: @licence_person.person_id }
    end

    assert_redirected_to licence_person_path(assigns(:licence_person))
  end

  test "should show licence_person" do
    get :show, id: @licence_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licence_person
    assert_response :success
  end

  test "should update licence_person" do
    patch :update, id: @licence_person, licence_person: { details: @licence_person.details, is_postgrad: @licence_person.is_postgrad, is_staffteacher: @licence_person.is_staffteacher, is_student: @licence_person.is_student, is_teacher: @licence_person.is_teacher, licence_id: @licence_person.licence_id, old_lastname: @licence_person.old_lastname, person_id: @licence_person.person_id }
    assert_redirected_to licence_person_path(assigns(:licence_person))
  end

  test "should destroy licence_person" do
    assert_difference('LicencePerson.count', -1) do
      delete :destroy, id: @licence_person
    end

    assert_redirected_to licence_people_path
  end
end
