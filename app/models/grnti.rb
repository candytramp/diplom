class Grnti < ActiveRecord::Base
	serialize :creator_data
	validates :grnti, :name, presence: true
	validates :grnti, uniqueness: true
	validates :grnti, length: {in: 2..8}
	has_many :research_efforts, dependent: :destroy
	has_paper_trail
end
