class NirType < ActiveRecord::Base
	has_many :research_efforts, dependent: :destroy
end
