require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, author: { article_id: @author.article_id, creator_data: @author.creator_data, creator_login: @author.creator_login, details: @author.details, lecturer: @author.lecturer, old_lastname: @author.old_lastname, person_id: @author.person_id, postgrad: @author.postgrad, senior_lecturer: @author.senior_lecturer, student: @author.student }
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should update author" do
    patch :update, id: @author, author: { article_id: @author.article_id, creator_data: @author.creator_data, creator_login: @author.creator_login, details: @author.details, lecturer: @author.lecturer, old_lastname: @author.old_lastname, person_id: @author.person_id, postgrad: @author.postgrad, senior_lecturer: @author.senior_lecturer, student: @author.student }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end
end
