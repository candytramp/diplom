class Person < ActiveRecord::Base
  serialize :external_ids
	has_one :user
	has_many :article_authors
	has_paper_trail
  include StringStrip
  validates :first_name, :last_name, presence: true, length: {maximum: 64}
  validates :second_name,  length: {maximum: 64}
end
