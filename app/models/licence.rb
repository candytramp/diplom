class TypeValidator < ActiveModel::Validator
	def validate(record)
		if record.type.present?
			a = (record.type =~ /\A[И|и]зобретение|[П|п]ромышленнный образец|[П|п]олезная модель\z/)
			b = (record.type =~ /\A[П|п]рограмма для ЭВМ|[Б|б]аза данных|[Т|т]товарный знак\z/)
			
			record.errors[:type] << 'Не корректный тип документа'	if a.nil? &&  b.nil?	 
			#record.errors << 'Не определен подтип документа' if !(!a.nil? && b.nil? && record.support.present?)
			#if a.nil? && !b.nil?
		else
			record.errors[:type] << 'Type key is not specified'
		end
	end
end

class Licence < ActiveRecord::Base
  include StringStrip
	belongs_to :ois_request
  validates :number, :type, :name, :expiration_date,:req_number,
			:req_author, :req_object, :req_status, :reg_agency,
			:req_priority, :support, presence: true
	validates :number, length: {maximum: 16}
	validates :type, length: {maximum: 32}

end
