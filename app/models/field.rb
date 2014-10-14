class Field < ActiveRecord::Base
	serialize :creator_data
	validates :code, :name, presence: true
	validates :code, uniqueness: true
	validates :code, length: {is: 8}
	has_many :research_efforts, dependent: :destroy
	has_paper_trail
end
