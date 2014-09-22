class Field < ActiveRecord::Base
	validates :code, :name, presence: true
	validates :code, length: {is: 8}
end
