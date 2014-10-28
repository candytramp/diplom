require 'test_helper'

class ArticleAuthorTest < ActiveSupport::TestCase
	test "boolean fields" do
		person = create(:person)
		puts person.inspect
		article = create(:article)
		puts article.inspect
		au2 = ArticleAuthor.new()
		au2.attributes = {article: article, person: person, is_teacher:	true, is_staffteacher: false,
   										is_student:	false, is_postgrad:	false, old_lastname:	'Dun'}
		assert au2.save
		#puts au2.inspect
		#assert au1.save 
	end
end
