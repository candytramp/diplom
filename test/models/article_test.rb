require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "should not save article without name" do
 		article = Article.new
		article.attributes = { start_page: 3, finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Impossible to save article without name"
	end
	test "should not save article without start_page" do
 		article = Article.new
		article.attributes = { name: "Art#1", finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Impossible to save article without start_page"
	end
    test "should not save article without finish_page" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3,  year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Impossible to save article without finish_page"
	end
	test "should not save article without year" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, year: 2000, source: {name: "World of Science", type: 'журнал',
                               output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Impossible to save article without year"
	end
	test "should not save article without source" do
 		article = Article.new
		article.attributes = {name: "Art#1", start_page: 3, finish_page: 50, year: 2010}
 		assert_not article.save, "Impossible to save article without source"
	end
   test "start_page must be integer" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: "gff3", finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "StartPage must be numeric"
	end
    test "finish_page must be integer" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: "thtrhrh50", year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "StartPage must be numeric"
	end
	 test "year must be integer" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, source: {name: "World of Science", type: 'журнал',
                              year: "rtht2000", output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "year must be numeric"
	end
 	test "year must be integer2" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, source: {name: "World of Science", type: 'журнал',
                              year: 2000.0, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "year must be numeric"
	end
	test "Year must be less or equal today year" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, source: {name: "World of Science", type: 'журнал',
                              year: 2500, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Year must be less or equal today year"
	end
    test "type of source must be specified" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, source: {name: "World of Science", 
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "Type must be specified"
	end
	
	  test "Magazine must have name attribute" do
 		article = Article.new
		article.attributes = { name: "Art#1", start_page: 3, finish_page: 50, source: {type: 'журнал',
                              year: 2000, output: 7, in_rinc: false, is_russian: false}}
 		assert_not article.save, "TMagazine should have name"
	end
	#convert_value_in_rinc_is_russian

    test "Convert values in_rinc is_russian#1" do
 		article = Article.new
        article.attributes = { name: "Art#1",start_page: 3, finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: "hallo world", is_russian: false}}
		article.save
		assert_equal true, article.source[:in_rinc]
	end
    test "Convert values in_rinc is_russian#2" do
 		article = Article.new
        article.attributes = { name: "Art#1",start_page: 3, finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, in_rinc: nil, is_russian: false}}
		article.save
		assert_equal false, article.source[:in_rinc]
	end
    test "Convert values in_rinc is_russian#3" do
 		article = Article.new
        article.attributes = { name: "Art#1",start_page: 3, finish_page: 50, year: 2010, source: {name: "World of Science", type: 'журнал',
                              year: 2000, output: 7, is_russian: false}}
		article.save
		assert_equal false, article.source[:in_rinc]
	end
end
