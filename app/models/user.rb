class User < ActiveRecord::Base
	belongs_to :person
	has_many :role_users, dependent: :destroy
	has_paper_trail
	validates :login, presence: true, uniqueness: true

  accepts_nested_attributes_for :role_users, reject_if: :all_blank

	scope :roles_join,->{joins(:role_users)}
  scope :join_all,->{includes(:person, :role_users => :role)}
	def default_role
		role_users.min_by { |ur| ur.role.priority }
	end

	def current_role
		@current_role || default_role
	end
	
	def is_admin?
		self.current_role.role.name == 'Admin'
	end

	def current_role=(role)
		role_permited = role_users.any? do |ur| 
			(self.id == role.user_id) || self.current_role.role.name == 'Admin'
		end
		if role_permited
			@current_role = role
		end
	end
end

