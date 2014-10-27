class ArticleAuthor < ActiveRecord::Base
  belongs_to :article
  belongs_to :person
	serialize :details
	has_paper_trail
	before_validation :convert_boolean_values
	validates :article_id, :person_id, uniqueness: true, presence: true
	
	private

	def convert_boolean_values
			boolean_fields = {self.is_teacher => :is_teacher, self.is_staffteacher => :is_staffteacher, 
												self.is_student => :is_student, self.is_postgrad => :is_postgrad}
			boolean_fields.each do |field,value|
			  if field.present?
					if field!=false && !field.nil?
						field = true 
					else
						field = false
		    	end	
				else
					self.errors[value] << "Отсутствует атрибут #{field}"
				end
			end		
	end
end

