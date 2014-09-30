class YearValueValidator < ActiveModel::Validator
	def validate(record)
		summary = 0
		if record.year_value.present?
			record.errors[:start_date] << " STDate key is missing" if !record.start_date.present?
			record.errors[:finish_date] << " FNDate key is missing" if !record.finish_date.present?
			record.year_value.each do |key, value|				
				if key.to_i < record.start_date.year || key.to_i > record.finish_date.year
					record.errors[:year_value] << 'Year value out of range!'
				end
				summary += value.to_f #check if value converts correctly
			end
			record.errors[:year_value] << 'Total sum greater than full_value' if summary > record.full_value.to_f

		else
			record.errors[:year_value] << 'Year_value key is missing!'
		end
	end
end


class ResearchEffort < ActiveRecord::Base

  serialize :year_value
  validates_with YearValueValidator
	before_validation :convert_nir_value
  belongs_to :state_program
  belongs_to :grnti
  belongs_to :field
  belongs_to :nir_type
  belongs_to :source
  belongs_to :scientific_school
	has_many :documents, :as=> :owner

	validates :name,:state_program_id, :start_date, :finish_date,
					  :grnti_id, :field_id, :nir_type_id, :source_id, 
						:scientific_school_id, presence: true
  #validates :is_nir, :inclusion => {:in => [true, false]}

 	validates :full_value,  numericality: { greater_than: 0, allow_nil: false }

	private

	def convert_nir_value
			#puts self.is_nir.to_s
			if self.is_nir!=false && !self.is_nir.nil?
			  self.is_nir = true 
			else
				self.is_nir = false
      end	
	end
end
