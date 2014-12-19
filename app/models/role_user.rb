class RoleUser < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :dept, polymorphic: true

  validates :user, :role, presence: true 
  validates :dept, presence: true, if: :should_have_department_id 
  validates :user, uniqueness: {scope: [:role_id, :dept_id]}

  def should_have_department_id
    ['Chairman', 'Secretary', 'Director'].include?(role.name)
  end

  def institute
    Department.find(dept_id)
  end

  def chair_id
    Chair.find(dept_id).number
  end

  def to_text
    case role.priority
    when 0 then "Администратор"
    when 1 then "Завкафедры №#{chair_id}"
    when 2 then "Секретарь каф. №#{chair_id}"
    when 3 then "ОЗИС"
    when 4 then "НИС"
    when 5 then "Директор #{institute.short_name}"
    when 6 then "Ректор"
    else "Гость"
    end
  end
end
