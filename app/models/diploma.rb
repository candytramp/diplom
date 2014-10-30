class Diploma < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail	
	has_many :documents, :as=> :owner

	validates :name, :year, presence: true
	validates :name, uniqueness: true
end
