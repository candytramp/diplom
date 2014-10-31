class Monograph < ActiveRecord::Base
	has_paper_trail	
	has_many :documents, :as=> :owner

	validates :name, :year, :isbn, :publisher, :pages, presence: true
	validates :name, uniqueness: true
	validates :isbn, length: {maximum: 32}
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
	validates :publisher, inclusion: {in: ['Зарубежное издательство','Российское издательство: "Высшая школа"',
																				 'Российское издательство: вуза (организации)','Российское издательство']}
end
