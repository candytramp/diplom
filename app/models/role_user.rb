class DapertmentValidator < ActiveModel::Validator
  def validate(record)   
	  role_user = RoleUser.all.load
	  role_user.each do |ru|
		  if (record.user.id == ru.user.id) && (record.role.id == ru.role.id)
        if (record.department.nil? && ru.department.nil?) || record.department.eql?(ru.department)
          record.errors[:user_id] << 'Такая роль у этого пользователя уже есть'
        end

				record.department.each do |key, value|
          #value - хеш типа 'ключ-> массив хешей'
          #RoleUser.create({user: user_one, role: role3, department: {kaf: [chair, chair2], inst: [depart]} })
          #acceptible keys: kaf, inst
          #каждому ключу соответствует массив хешей
          #вида 
          #chair  = {name: 'ИВЦ', number: 11}
          #chair2  = {name: 'qwe', number: 11}
          #depart = {sname: 'СГТИ', fname: 'Институт социальных и гуманитарных технологий'}   
					if ['kaf','inst'].include?(key) && ru.department.include?(key)
            a = ru.department[key]
            b = record.department[key]
            c = a.concat(b).uniq
            record.errors[:user_id] << 'Такая роль у этого пользователя уже есть' if c.size < a.size
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
  validates :user, :role, presence: true
  validates_with DapertmentValidator
  #validates :user, uniqueness: {scope: :role}

  def institute
    Department.find(dept_id)
  end

  def chair_id
    Chair.find(dept_id).number
  end
  def to_text
    case role.priority
    when 0 then "Администратор"
    when 1 then "Завкафедры"# №#{chair_id}"
    when 2 then "Секретарь каф. "# №#{chair_id}"
        #self.department['kaf'].each do |kf|
         # kfnumb = kf['number']
         # "Секретарь каф. #{kfnumb}"# №#{chair_id}"
       # end
    when 3 then "ОЗИС"
    when 4 then "НИС"
    when 5 then "Директор #{institute.short_name}"
    when 6 then "Ректор"
    else "Гость"
    end
  end
end
