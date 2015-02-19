class Role < ActiveRecord::Base
  has_many :role_users, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  scope :roles_join,->{includes(:role_users)}
  validates :priority, numericality: { only_integer: true}, inclusion: 0..10 
end
