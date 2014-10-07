require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  setup do
    @conference = conferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conference" do
    assert_difference('Conference.count') do
      post :create, conference: { city: @conference.city, country: @conference.country, creator_data: @conference.creator_data, creator_login: @conference.creator_login, ctype: @conference.ctype, finish: @conference.finish, name: @conference.name, start: @conference.start, year: @conference.year }
    end

    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should show conference" do
    get :show, id: @conference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conference
    assert_response :success
  end

  test "should update conference" do
    patch :update, id: @conference, conference: { city: @conference.city, country: @conference.country, creator_data: @conference.creator_data, creator_login: @conference.creator_login, ctype: @conference.ctype, finish: @conference.finish, name: @conference.name, start: @conference.start, year: @conference.year }
    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should destroy conference" do
    assert_difference('Conference.count', -1) do
      delete :destroy, id: @conference
    end

    assert_redirected_to conferences_path
  end
end
