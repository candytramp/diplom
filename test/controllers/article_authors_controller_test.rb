require 'test_helper'

class ArticleAuthorsControllerTest < ActionController::TestCase
  setup do
    @article_author = article_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_author" do
    assert_difference('ArticleAuthor.count') do
      post :create, article_author: { article_id: @article_author.article_id, details: @article_author.details, is_postgrad: @article_author.is_postgrad, is_staffteacher: @article_author.is_staffteacher, is_student: @article_author.is_student, is_teacher: @article_author.is_teacher, old_lastname: @article_author.old_lastname, person_id: @article_author.person_id }
    end

    assert_redirected_to article_author_path(assigns(:article_author))
  end

  test "should show article_author" do
    get :show, id: @article_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_author
    assert_response :success
  end

  test "should update article_author" do
    patch :update, id: @article_author, article_author: { article_id: @article_author.article_id, details: @article_author.details, is_postgrad: @article_author.is_postgrad, is_staffteacher: @article_author.is_staffteacher, is_student: @article_author.is_student, is_teacher: @article_author.is_teacher, old_lastname: @article_author.old_lastname, person_id: @article_author.person_id }
    assert_redirected_to article_author_path(assigns(:article_author))
  end

  test "should destroy article_author" do
    assert_difference('ArticleAuthor.count', -1) do
      delete :destroy, id: @article_author
    end

    assert_redirected_to article_authors_path
  end
end
