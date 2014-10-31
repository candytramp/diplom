class Exhibit < ActiveRecord::Base
  belongs_to :exhibition
	has_paper_trail

	validates :name, :year, :exhibition_id, presence: true
	validates :name, uniqueness: true
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
end
