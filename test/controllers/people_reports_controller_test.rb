require 'test_helper'

class PeopleReportsControllerTest < ActionController::TestCase
  setup do
    @people_report = people_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_report" do
    assert_difference('PeopleReport.count') do
      post :create, people_report: { details: @people_report.details, is_postgrad: @people_report.is_postgrad, is_staffteacher: @people_report.is_staffteacher, is_student: @people_report.is_student, is_teacher: @people_report.is_teacher, old_lastname: @people_report.old_lastname, person_id: @people_report.person_id, report_id: @people_report.report_id }
    end

    assert_redirected_to people_report_path(assigns(:people_report))
  end

  test "should show people_report" do
    get :show, id: @people_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_report
    assert_response :success
  end

  test "should update people_report" do
    patch :update, id: @people_report, people_report: { details: @people_report.details, is_postgrad: @people_report.is_postgrad, is_staffteacher: @people_report.is_staffteacher, is_student: @people_report.is_student, is_teacher: @people_report.is_teacher, old_lastname: @people_report.old_lastname, person_id: @people_report.person_id, report_id: @people_report.report_id }
    assert_redirected_to people_report_path(assigns(:people_report))
  end

  test "should destroy people_report" do
    assert_difference('PeopleReport.count', -1) do
      delete :destroy, id: @people_report
    end

    assert_redirected_to people_reports_path
  end
end
