class User < ActiveRecord::Base
	belongs_to :person
	serialize :creator_data
	has_paper_trail
	validates :login,  presence: true
end
