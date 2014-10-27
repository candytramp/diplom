require 'test_helper'

class ArticleAuthorTest < ActiveSupport::TestCase
	test "boolean fields" do
		person = create(:person)
		puts person.inspect
		article = create(:article)
		puts article.inspect
		au1 = build(:article_author, :author_with_boolean_fields, article: article, person: person)
		puts au1.inspect
		assert au1.save 
	end
end
