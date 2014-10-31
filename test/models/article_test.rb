require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "art_with_incorrect_year" do
		article = build(:article, :art_with_bad_year)
		#puts article.inspect
		assert_not article.save
	end

  test "art_copy_year" do
		article = build(:article, :art_copy_year)
    article.save
		#puts article.inspect
		assert article.year, article.source[:year]
	end
end
