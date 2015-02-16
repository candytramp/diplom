module UsersHelper
  def select_person_options
    Person.all.collect {|p| [ p.last_name + ' ' + p.first_name + ' '+ p.second_name, p.id ]}
  end
end
