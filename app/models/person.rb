class Person < ActiveRecord::Base
  serialize :external_ids
end
