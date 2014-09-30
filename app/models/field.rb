class Field < ActiveRecord::Base
	validates :code, :name, presence: true, uniqueness: true
	validates :code, length: {is: 8}
	has_many :research_efforts, dependent: :destroy
end
