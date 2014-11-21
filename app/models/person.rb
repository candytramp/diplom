class Person < ActiveRecord::Base
  serialize :external_ids
	has_one :user
	has_many :article_authors
	has_many :diploma_people
	has_many :exhibition_people
	has_many :exhibit_people
	has_many :licence_people
	has_many :people_reports
	has_many :people_research_efforts
	has_many :people_textbooks
	has_many :author_monographs
	has_many :authur_requests
	has_many :conference_people
	has_many :theses
	has_paper_trail
  include StringStrip
  validates :first_name, :last_name, presence: true, length: {maximum: 64}
  validates :second_name,  length: {maximum: 64}
end
