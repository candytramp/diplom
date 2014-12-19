class RoleUser < ActiveRecord::Base
  belongs_to :user
  validates :user, :role_id, presence: true 
  validates :department_id, presence: true, if: :should_have_department_id 
  validates :user, uniqueness: {scope: [:role_id, :department_id]}

  def should_have_department_id
    [Role::CHAIRMAN, Role::SECRETARY, Role::DIRECTOR].include?(role_id)
  end

  def institute
    Inst.find(department_id)
  end

  def chair_id
    department_id
  end

  def to_text
    case role_id
    when Role::ADMIN then "Администратор"
    when Role::CHAIRMAN then "Завкафедры №#{chair_id}"
    when Role::SECRETARY then "Секретарь каф. №#{chair_id}"
    when Role::OZIS then "ОЗИС"
    when Role::NIS then "НИС"
    when Role::DIRECTOR then "Директор #{institute.short_name}"
    when Role::RECTOR then "Ректор"
    else "Гость"
    end
  end
end
