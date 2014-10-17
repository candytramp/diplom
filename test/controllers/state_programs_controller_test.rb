require 'test_helper'

class StateProgramsControllerTest < ActionController::TestCase
  setup do
    @state_program = state_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_program" do
    assert_difference('StateProgram.count') do
      post :create, state_program: { name: @state_program.name }
    end

    assert_redirected_to state_program_path(assigns(:state_program))
  end

  test "should show state_program" do
    get :show, id: @state_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state_program
    assert_response :success
  end

  test "should update state_program" do
    patch :update, id: @state_program, state_program: { name: @state_program.name }
    assert_redirected_to state_program_path(assigns(:state_program))
  end

  test "should destroy state_program" do
    assert_difference('StateProgram.count', -1) do
      delete :destroy, id: @state_program
    end

    assert_redirected_to state_programs_path
  end
end
