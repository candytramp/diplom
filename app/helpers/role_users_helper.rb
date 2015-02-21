module RoleUsersHelper
  def select_user_options
    User.all.collect {|p| [ p.login, p.id ]}
  end
  def select_role_options
    Role.all.collect {|p| [ p.name, p.id ]}
  end

  def set_default_value(hash, key)
    return if hash.nil?
    hash.each do |k, v|
      return v if k==key
      if v.kind_of?(Hash)
        puts "#{k}"
        rv = set_default_value(v, key)
        return rv unless rv.nil?
      end
    end
    return nil
  end
end
