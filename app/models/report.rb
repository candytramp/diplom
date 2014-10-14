class Report < ActiveRecord::Base
  belongs_to :conference
	serialize :creator_data
	belongs_to :articles
	has_paper_trail
	validates :conference_id, presence: true
end
