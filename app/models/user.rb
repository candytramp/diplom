class User < ActiveRecord::Base
	belongs_to :person
	has_paper_trail
	validates :login,  presence: true
end
