class Person < ActiveRecord::Base
  serialize :external_ids
  include StringStrip
  validates :first_name, :last_name, presence: true, length: {maximum: 64}
  validates :second_name,  length: {maximum: 64}
end
