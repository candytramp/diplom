class TypeValidator < ActiveModel::Validator
	def validate(record)
		if record.type.present?
			a = (record.type =~ /\A[И|и]зобретение|[П|п]ромышленнный образец|[П|п]олезная модель\z/)
			b = (record.type =~ /\A[П|п]рограмма для ЭВМ|[Б|б]аза данных|[Т|т]товарный знак\z/)
			
			record.errors[:type] << 'Не корректный тип документа'	if a.nil? &&  b.nil?	 
			if !a.nil? && b.nil?
				record.errors[:support] << 'Отсутствует подтип документа' if !record.support.present? 
			else
 				if (c = (record.support =~ /\Aпатент|поддержка патента\z/))
					record.errors[:support] << 'Не корректный подтип документа'
				end
			end
			#if a.nil? && !b.nil?
		else
			record.errors[:type] << 'Тип документа не определен'
		end
	end
end

class Licence < ActiveRecord::Base
  include StringStrip
	validates_with TypeValidator
	belongs_to :ois_request
	has_many :documents, :as => :owner

  #:expiration_date,:req_number,:req_author, :req_object, :req_status, :reg_agency,:req_priority, :support
  validates :number, :type, :name, presence: true
	validates :number, length: {maximum: 16}
	validates :type, length: {maximum: 32}

end
