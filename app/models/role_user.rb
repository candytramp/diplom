class DapertmentValidator < ActiveModel::Validator
  def validate(record)   
	  role_user = RoleUser.all.load
	  role_user.each do |ru|
      if ['HeadOfDept','Secretary','Director'].include?(record.role.name)
          record.errors[:role_id] << 'У завкафедры/секретаря/директора должен быть опред. институт' if !record.department.has_key?(:inst)
          if record.role.name == 'HeadOfDept'
            record.errors[:role_id] << ' У завкафедры должна быть опред. кафедра' unless record.department.has_key?(:dept)
          end
        end

		  if (record.user.id == ru.user.id) && (record.role.id == ru.role.id)
        if (record.department.nil? && ru.department.nil?) || record.department.eql?(ru.department)
          record.errors[:user_id] << 'Такая роль у этого пользователя уже есть'
        end
        case record.role.name
        when 'HeadOfDept' then
          if record.department[:inst].eql?(ru.department[:inst]) && record.department[:dept].eql?(ru.department[:dept])
            record.errors[:user_id] << 'Такая роль у этого пользователя уже есть'
          end
        when 'Secretary' then
          if record.department[:dept].nil? && ru.department[:dept].nil?
            record.errors[:user_id] << 'Такая роль у этого пользователя уже есть' if record.department[:inst].eql?(ru.department[:inst])
          else
            record.errors[:user_id] << 'Такая роль у этого пользователя уже есть' if record.department[:inst].eql?(ru.department[:inst]) && record.department[:dept].eql?(ru.department[:dept])
          end
        when 'Director' then
          record.errors[:user_id] << 'Такая роль у этого пользователя уже есть' if record.department[:inst].eql?(ru.department[:inst])
        end
						#record.department.each do |key, value|
				      #value - хеш 
				      #RoleUser.create({user: user_one, role: role3, department: {dept: department, inst: institute, other: nil} })
				      #department  = {name: 'ИВЦ', number: 11}
				      #institute = {sname: 'СГТИ', fname: 'Институт социальных и гуманитарных технологий'}   
							#if ['dept','inst'].include?(key) && ru.department.include?(key)

				        #record.errors[:user_id] << 'Такая роль у этого пользователя уже есть' if record.department[key].eql?(ru.department[key])
				      #end					  
						#end
			end
		end
  end
end
class RoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  serialize :department
  validates :user, :role, presence: true
  validates_with DapertmentValidator
  #validates :user, uniqueness: {scope: :role}
  
  accepts_nested_attributes_for :role, :reject_if => :all_blank, allow_destroy: true
  def chair
    return self.department[:dept][:number].to_s + '('+ self.department[:inst][:sname] + ')' if self.department.has_key?(:dept)
    return "#{self.department[:inst][:sname]}"
  end
  def to_text
    case role.name
    when 'Admin'      then "Администратор"
    when 'HeadOfDept' then "Завкафедры #{self.department[:dept][:number]}/#{(self.department[:inst][:sname])}"
    when 'Secretary'  then "Секретарь каф. #{chair}"
    when 'Ozis'       then "ОЗИС"
    when 'Nis'        then "НИС"
    when 'Director'   then "Директор #{self.department[:inst][:sname]}"
    when 'Rector'     then "Ректор"
    else "Гость"
    end
  end
  
end
