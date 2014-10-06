class Source < ActiveRecord::Base
	serialize :creator_data
  validates :funding_source, presence: true, uniqueness: true
	has_many :research_efforts, dependent: :destroy
end
