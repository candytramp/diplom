require 'test_helper'

class PeopleResearchEffortsControllerTest < ActionController::TestCase
  setup do
    @people_research_effort = people_research_efforts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_research_efforts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_research_effort" do
    assert_difference('PeopleResearchEffort.count') do
      post :create, people_research_effort: { details: @people_research_effort.details, is_postgrad: @people_research_effort.is_postgrad, is_staffteacher: @people_research_effort.is_staffteacher, is_student: @people_research_effort.is_student, is_teacher: @people_research_effort.is_teacher, old_lastname: @people_research_effort.old_lastname, person_id: @people_research_effort.person_id, person_value: @people_research_effort.person_value, research_effort_id: @people_research_effort.research_effort_id, role: @people_research_effort.role }
    end

    assert_redirected_to people_research_effort_path(assigns(:people_research_effort))
  end

  test "should show people_research_effort" do
    get :show, id: @people_research_effort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_research_effort
    assert_response :success
  end

  test "should update people_research_effort" do
    patch :update, id: @people_research_effort, people_research_effort: { details: @people_research_effort.details, is_postgrad: @people_research_effort.is_postgrad, is_staffteacher: @people_research_effort.is_staffteacher, is_student: @people_research_effort.is_student, is_teacher: @people_research_effort.is_teacher, old_lastname: @people_research_effort.old_lastname, person_id: @people_research_effort.person_id, person_value: @people_research_effort.person_value, research_effort_id: @people_research_effort.research_effort_id, role: @people_research_effort.role }
    assert_redirected_to people_research_effort_path(assigns(:people_research_effort))
  end

  test "should destroy people_research_effort" do
    assert_difference('PeopleResearchEffort.count', -1) do
      delete :destroy, id: @people_research_effort
    end

    assert_redirected_to people_research_efforts_path
  end
end
