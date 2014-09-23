class StateProgram < ActiveRecord::Base
	validates :name, presence :true
	has_many :research_efforts
end
