class ResearchEffortFile < ActiveRecord::Base
  belongs_to :research_effort
	validates :research_effort_id, presence: true
  has_attached_file :document, styles: {thumbnail: "60x60#"}
	#validates_attachment :document, content_type: { content_type: ['application/pdf', 'image/jpeg', 'image/tiff', 'image/bmp', 'image/png' ]}
	
end
