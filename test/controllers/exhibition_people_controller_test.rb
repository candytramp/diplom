require 'test_helper'

class ExhibitionPeopleControllerTest < ActionController::TestCase
  setup do
    @exhibition_person = exhibition_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exhibition_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exhibition_person" do
    assert_difference('ExhibitionPerson.count') do
      post :create, exhibition_person: { details: @exhibition_person.details, exhibition_id: @exhibition_person.exhibition_id, is_postgrad: @exhibition_person.is_postgrad, is_staffteacher: @exhibition_person.is_staffteacher, is_student: @exhibition_person.is_student, is_teacher: @exhibition_person.is_teacher, old_lastname: @exhibition_person.old_lastname, person_id: @exhibition_person.person_id }
    end

    assert_redirected_to exhibition_person_path(assigns(:exhibition_person))
  end

  test "should show exhibition_person" do
    get :show, id: @exhibition_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exhibition_person
    assert_response :success
  end

  test "should update exhibition_person" do
    patch :update, id: @exhibition_person, exhibition_person: { details: @exhibition_person.details, exhibition_id: @exhibition_person.exhibition_id, is_postgrad: @exhibition_person.is_postgrad, is_staffteacher: @exhibition_person.is_staffteacher, is_student: @exhibition_person.is_student, is_teacher: @exhibition_person.is_teacher, old_lastname: @exhibition_person.old_lastname, person_id: @exhibition_person.person_id }
    assert_redirected_to exhibition_person_path(assigns(:exhibition_person))
  end

  test "should destroy exhibition_person" do
    assert_difference('ExhibitionPerson.count', -1) do
      delete :destroy, id: @exhibition_person
    end

    assert_redirected_to exhibition_people_path
  end
end
