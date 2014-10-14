class Conference < ActiveRecord::Base
	has_many :reports
	serialize :creator_data
	has_paper_trail
	validates :name, :ctype, presence: true
	validates :ctype, inclusion: {in: ['международная','на базе вуза','региональная','всероссийская', 'другое']}
end
