
class YearValueValidator < ActiveModel::Validator
	def validate(record)
		if record.year_value.present?

			record.year_value.each do |key, value|
				if key < record.start_date.year || key > record.finish_date.year
					record.errors[:year_value] << 'Year value out of range!'
				end
			end
		
		else
			record.errors[:year_value] << 'Year_value key is missing!'
		end
	end
end


class ResearchEffort < ActiveRecord::Base
	validates_with YearValueValidator
  belongs_to :state_program
  belongs_to :grnti
  belongs_to :field
  belongs_to :nir_type
  belongs_to :source
	has_many :research_effort_files, dependent: :destroy

  validates :name,:state_program_id, :start_date, :finish_date, :is_nir,
            :grnti_id, :field_id, :nir_type_id, :source_id, :scientific_school, presence: true
  validates :state_reg_number, :nir_number, :inventory_number, 
             numericality: { only_integer: true, greater_than: 0, allow_nil: false }
  validates :full_value,  numericality: { greater_than: 0, allow_nil: false }
end
