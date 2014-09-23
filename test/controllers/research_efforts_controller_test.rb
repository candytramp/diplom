require 'test_helper'

class ResearchEffortsControllerTest < ActionController::TestCase
  setup do
    @research_effort = research_efforts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_efforts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_effort" do
    assert_difference('ResearchEffort.count') do
      post :create, research_effort: { field_id: @research_effort.field_id, finish_date: @research_effort.finish_date, full_value: @research_effort.full_value, grnti_id: @research_effort.grnti_id, inventory_number: @research_effort.inventory_number, name: @research_effort.name, nir_number: @research_effort.nir_number, nir_type_id: @research_effort.nir_type_id, scientific_school: @research_effort.scientific_school, source_id: @research_effort.source_id, start_date: @research_effort.start_date, state_program_id: @research_effort.state_program_id, state_reg_number: @research_effort.state_reg_number, year_value: @research_effort.year_value }
    end

    assert_redirected_to research_effort_path(assigns(:research_effort))
  end

  test "should show research_effort" do
    get :show, id: @research_effort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_effort
    assert_response :success
  end

  test "should update research_effort" do
    patch :update, id: @research_effort, research_effort: { field_id: @research_effort.field_id, finish_date: @research_effort.finish_date, full_value: @research_effort.full_value, grnti_id: @research_effort.grnti_id, inventory_number: @research_effort.inventory_number, name: @research_effort.name, nir_number: @research_effort.nir_number, nir_type_id: @research_effort.nir_type_id, scientific_school: @research_effort.scientific_school, source_id: @research_effort.source_id, start_date: @research_effort.start_date, state_program_id: @research_effort.state_program_id, state_reg_number: @research_effort.state_reg_number, year_value: @research_effort.year_value }
    assert_redirected_to research_effort_path(assigns(:research_effort))
  end

  test "should destroy research_effort" do
    assert_difference('ResearchEffort.count', -1) do
      delete :destroy, id: @research_effort
    end

    assert_redirected_to research_efforts_path
  end
end
