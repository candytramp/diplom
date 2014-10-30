require 'test_helper'

class MonographsControllerTest < ActionController::TestCase
  setup do
    @monograph = monographs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monographs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monograph" do
    assert_difference('Monograph.count') do
      post :create, monograph: { isbn: @monograph.isbn, name: @monograph.name, pages: @monograph.pages, publish_year: @monograph.publish_year, publisher: @monograph.publisher, publisher_name: @monograph.publisher_name, year: @monograph.year }
    end

    assert_redirected_to monograph_path(assigns(:monograph))
  end

  test "should show monograph" do
    get :show, id: @monograph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monograph
    assert_response :success
  end

  test "should update monograph" do
    patch :update, id: @monograph, monograph: { isbn: @monograph.isbn, name: @monograph.name, pages: @monograph.pages, publish_year: @monograph.publish_year, publisher: @monograph.publisher, publisher_name: @monograph.publisher_name, year: @monograph.year }
    assert_redirected_to monograph_path(assigns(:monograph))
  end

  test "should destroy monograph" do
    assert_difference('Monograph.count', -1) do
      delete :destroy, id: @monograph
    end

    assert_redirected_to monographs_path
  end
end
