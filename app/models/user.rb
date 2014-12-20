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
			(self.id == role.user_id) || self.current_role.role.priority == 0
		end
		if role_permited
			@current_role = role
		end
	end
end

