class Role < ActiveRecord::Base
  has_many :role_users, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  scope :roles_join,->{includes(:role_users)}
end
