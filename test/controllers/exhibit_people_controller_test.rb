require 'test_helper'

class ExhibitPeopleControllerTest < ActionController::TestCase
  setup do
    @exhibit_person = exhibit_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exhibit_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exhibit_person" do
    assert_difference('ExhibitPerson.count') do
      post :create, exhibit_person: { details: @exhibit_person.details, exhibit_id: @exhibit_person.exhibit_id, is_postgrad: @exhibit_person.is_postgrad, is_staffteacher: @exhibit_person.is_staffteacher, is_student: @exhibit_person.is_student, is_teacher: @exhibit_person.is_teacher, old_lastname: @exhibit_person.old_lastname, person_id: @exhibit_person.person_id }
    end

    assert_redirected_to exhibit_person_path(assigns(:exhibit_person))
  end

  test "should show exhibit_person" do
    get :show, id: @exhibit_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exhibit_person
    assert_response :success
  end

  test "should update exhibit_person" do
    patch :update, id: @exhibit_person, exhibit_person: { details: @exhibit_person.details, exhibit_id: @exhibit_person.exhibit_id, is_postgrad: @exhibit_person.is_postgrad, is_staffteacher: @exhibit_person.is_staffteacher, is_student: @exhibit_person.is_student, is_teacher: @exhibit_person.is_teacher, old_lastname: @exhibit_person.old_lastname, person_id: @exhibit_person.person_id }
    assert_redirected_to exhibit_person_path(assigns(:exhibit_person))
  end

  test "should destroy exhibit_person" do
    assert_difference('ExhibitPerson.count', -1) do
      delete :destroy, id: @exhibit_person
    end

    assert_redirected_to exhibit_people_path
  end
end
