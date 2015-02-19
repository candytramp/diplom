module RoleUsersHelper
  def select_user_options
    User.all.collect {|p| [ p.login, p.id ]}
  end
  def select_role_options
    Role.all.collect {|p| [ p.name, p.id ]}
  end
  def set_gefault_value(key)
   # if role.department.has_key?(key)
      
  end
end
