class ArticleAuthor < ActiveRecord::Base
  belongs_to :article
  belongs_to :person
	serialize :details
	has_paper_trail

  validates :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :inclusion => {:in => [true, false]}
	validates :article_id, :person_id, uniqueness: true, presence: true
end

