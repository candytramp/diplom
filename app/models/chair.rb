class Chair < ActiveRecord::Base
  belongs_to :department
  has_many :role_users, :as=> :dept
end
