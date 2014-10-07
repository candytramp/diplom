class Report < ActiveRecord::Base
  belongs_to :conference
	serialize :creator_data
	belongs_to :articles

	validates :conference_id, presence: true
end
