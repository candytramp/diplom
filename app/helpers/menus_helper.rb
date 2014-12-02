module MenusHelper

  def menu(user = nil, role = nil)
    if user.nil?
      {}
    else
      {'Редактирование' => {'Учебники' => {:controller => :textbooks, :action => :index},
        'Монографии' => {:controller => :monographs, :action => :index}},
        'Очёт' => {:controller => :people, :action => :index}}
=begin
      role = user.roles.first if role.nil  
      case role.name
      when 'admin'
        {}
      default
        {}
      end
=end      
    end
  end
end
