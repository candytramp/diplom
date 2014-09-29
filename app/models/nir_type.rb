class NirType < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
end
