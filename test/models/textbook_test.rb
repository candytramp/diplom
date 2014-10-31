require 'test_helper'

class TextbookTest < ActiveSupport::TestCase
 	test "save with all correct fields" do
		textbook = build(:textbook)
		assert textbook.save
	end
	test "dont save with uncorrect grif type" do
		textbook = build(:textbook, :txt_with_bad_grif)
		assert_not textbook.save, "Bad grif"
	end
	test "dont save with uncorrect year field" do
		textbook = build(:textbook, :txt_with_bad_year )
		assert_not textbook.save, "Bad year value"
	end
	test "dont save with too long isbn" do
		textbook = build(:textbook, :txt_too_long_isbn )
		assert_not textbook.save, "Too long isbn"
	end
end
