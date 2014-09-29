class ScientificSchool < ActiveRecord::Base
	validates :name, presense: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
end
