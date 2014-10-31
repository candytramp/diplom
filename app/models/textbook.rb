class Textbook < ActiveRecord::Base
	has_paper_trail	
	has_many :documents, :as=> :owner

	validates :title, :year, :isbn, :grif, :pages, :publisher, presence: true
	validates :title, uniqueness: true
	validates :isbn, length: {maximum: 32}
	validates :year, numericality: {less_than_or_equal_to: Date.today.year} 
	validates :publisher, inclusion: {in: ['Зарубежное издательство','Российское издательство: "Высшая школа"',
																				 'Российское издательство: вуза (организации)','Российское издательство']}
	validates :grif, inclusion: {in: ['гриф УМО или НМС', 'гриф Рособразования (Минобразования России)', 
																		'гриф других федеральных органов исполнительной власти', 'другой гриф', 'без грифа']}
	validates :textbook_type, inclusion: {in: ['учебник', 'учебное пособие', 'учебно-методическое пособие','методическое пособие']}
end
