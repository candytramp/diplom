class Source < ActiveRecord::Base
	validates :funding_source, presence: true
end
