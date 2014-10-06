require 'test_helper'

class ScientificSchoolsControllerTest < ActionController::TestCase
  setup do
    @scientific_school = scientific_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scientific_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scientific_school" do
    assert_difference('ScientificSchool.count') do
      post :create, scientific_school: { creator_data: @scientific_school.creator_data, creator_login: @scientific_school.creator_login, name: @scientific_school.name }
    end

    assert_redirected_to scientific_school_path(assigns(:scientific_school))
  end

  test "should show scientific_school" do
    get :show, id: @scientific_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scientific_school
    assert_response :success
  end

  test "should update scientific_school" do
    patch :update, id: @scientific_school, scientific_school: { creator_data: @scientific_school.creator_data, creator_login: @scientific_school.creator_login, name: @scientific_school.name }
    assert_redirected_to scientific_school_path(assigns(:scientific_school))
  end

  test "should destroy scientific_school" do
    assert_difference('ScientificSchool.count', -1) do
      delete :destroy, id: @scientific_school
    end

    assert_redirected_to scientific_schools_path
  end
end
