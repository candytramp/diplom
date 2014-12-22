class DapertmentValidator < ActiveModel::Validator
  def validate(record)    
	  role_user = RoleUser.all
	  role_user.each do |ru|
		  if (record.user.id == ru.user.id) && (record.role.id == ru.role.id)
        if (record.department.nil? && ru.department.nil?) || record.department.eql?(ru.department)
          record.errors[:user_id] << 'Такая роль у этого пользователя уже есть'
        end
				record.department.each do |key, value|
					if ru.department.include?(key)
            
          end					  
				end
			end
		end
  end
end
class RoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  serialize :department
  validates_with DapertmentValidator
end
