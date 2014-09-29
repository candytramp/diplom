class YearValueValidator < ActiveModel::Validator
	def validate(record)
		summary = 0
		if record.year_value.present?

			record.year_value.each do |key, value|				
				if key < record.start_date.year || key > record.finish_date.year
					record.errors[:year_value] << 'Year value out of range!'
				end
				summary += value.to_f #check if value converts correctly
			end
			record.errors[:year_value] << 'Total sum greater than full_value' if summary > full_value

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
  belongs_to :scientific_school
	has_many :documents, :as=> :owner

	validates :name,:state_program_id, :start_date, :finish_date, :is_nir,
            :grnti_id, :field_id, :nir_type_id, :source_id, :scientific_school_id, presence: true

 	validates :full_value,  numericality: { greater_than: 0, allow_nil: false }
end
