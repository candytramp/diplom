class Exhibition < ActiveRecord::Base
	serialize :creator_data
	has_paper_trail	
	has_many :exhibits

	validates :name, :year, presence: true
	validates :name, uniqueness: true
	validates :etype, inclusion: {in: ['международная','на базе вуза','региональная','всероссийская', 'другое']}
end
