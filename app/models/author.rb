class Author < ActiveRecord::Base
  belongs_to :article
  belongs_to :person
	has_paper_trail

	serialize :creator_data
	serialize :details
end
