class YearCheck
  def check(value)
    year = value.to_i
    year > 0 &&  year <= Date.today.year
  end
end
class YearValueValidator < ActiveModel::Validator
	def validate(record)
		if record.year_value.present?
			
		end
	end
end


class ResearchEffort < ActiveRecord::Base
	#validates_with YearValueValidator
  belongs_to :state_program
  belongs_to :grnti
  belongs_to :field
  belongs_to :nir_type
  belongs_to :source
	has_many :research_effort_files

  validates :name,:state_program_id, :start_date, :finish_date, 
            :grnti_id, :field_id, :nir_type_id, :source_id, :scientific_school, presence: true
  validates :state_reg_number, :nir_number, :inventory_number, 
             numericality: { only_integer: true, greater_than: 0, allow_nil: false }
  validates :full_value,  numericality: { greater_than: 0, allow_nil: false }
end
