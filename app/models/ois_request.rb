class OisRequest < ActiveRecord::Base
 	belongs_to :research_effort
	has_one: :licence
	has_many :documents, :as => :owner
	serialize :creator_data
  validates :number, :priority, :author, # :name,
						:object, :reg_agency, 
						:status, presence: true
end
