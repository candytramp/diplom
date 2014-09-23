class Grnti < ActiveRecord::Base
	validates :grnti, :name, presence: true
	validates :grnti, length: {is: 2}
	has_many :research_efforts
end
