class User < ActiveRecord::Base
	belongs_to :person
	has_many :role_users
	has_paper_trail
	validates :login, presence: true, uniqueness: true
	
	scope :roles_join,->{includes(:role_users)}

	def default_role
		role_users.min_by { |ur| ur.role.priority }
	end

	def current_role
		@current_role || default_role
	end

	def current_role=(role)
		role_permited = role_users.any? do |ur| 
			ur.role.priority == 0 || (ur.role.id == role.id && ur.dept_id == role.dept_id && ur.dept_type == role.dept_type ) 
		end
		if role_permited
			@current_role = role
		end
	end
end

=begin
class Role
	ADMIN = 0
	CHAIRMAN = 1
	SECRETARY = 2
	OZIS = 3
	NIS = 4
	DIRECTOR = 5
	RECTOR = 6
end

class Inst
	attr_reader :short_name, :full_name, :id

	def initialize(id, short_name, full_name)
		@id = id
		@short_name = short_name 
		@full_name = full_name
	end

	LIST = [
		Inst.new(0, "ИИТУ", "Институт информационных технологий и управления в технических системах"),
		Inst.new(1, "ТИ", "Технологический институт"),
		Inst.new(2, "ИЭТС", "Институт энергетики и транспортных систем"),
		Inst.new(3, "ЮИ", "Юридический институт"),
		Inst.new(4, "ИЭУ", "Институт экономики и управления"),
		Inst.new(5, "СГТИ", "Институт социальных и гуманитарных технологий"),
		Inst.new(6, "ИДО", "Институт дистанционного образования")
	]

	def self.find(id)
		raise ArgumentError.new("negative id") if id < 0
		LIST[id]
	end

	def self.find_by_short_name(name)
		LIST.find { |i| i.short_name == name }
	end
end
=end
