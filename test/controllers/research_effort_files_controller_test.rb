require 'test_helper'

class ResearchEffortFilesControllerTest < ActionController::TestCase
  setup do
    @research_effort_file = research_effort_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_effort_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_effort_file" do
    assert_difference('ResearchEffortFile.count') do
      post :create, research_effort_file: { description: @research_effort_file.description, research_effort_id: @research_effort_file.research_effort_id }
    end

    assert_redirected_to research_effort_file_path(assigns(:research_effort_file))
  end

  test "should show research_effort_file" do
    get :show, id: @research_effort_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_effort_file
    assert_response :success
  end

  test "should update research_effort_file" do
    patch :update, id: @research_effort_file, research_effort_file: { description: @research_effort_file.description, research_effort_id: @research_effort_file.research_effort_id }
    assert_redirected_to research_effort_file_path(assigns(:research_effort_file))
  end

  test "should destroy research_effort_file" do
    assert_difference('ResearchEffortFile.count', -1) do
      delete :destroy, id: @research_effort_file
    end

    assert_redirected_to research_effort_files_path
  end
end
