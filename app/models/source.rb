class Source < ActiveRecord::Base
	validates :funding_source, presence: true
	has_many :research_efforts
end
