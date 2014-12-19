class Department < ActiveRecord::Base
  has_many :role_users, :as=> :dept
  has_many :chairs
end
