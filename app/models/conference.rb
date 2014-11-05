class Conference < ActiveRecord::Base
	has_many :reports
	serialize :creator_data
	has_paper_trail
	has_many :diplomas, :as=> :reward
	validates :name, :ctype, presence: true
	validates :ctype, inclusion: {in: ['международная','на базе вуза','региональная','всероссийская', 'другое']}
end
