require 'rails_helper'

RSpec.describe RoleUser, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  user_one = User.create(login: 'kna54')
  user_two = User.create(login: 'sis34')
  chair  = {name: 'Прикладной информатики', number: 12}
  depart = {sname: 'ИИТУ', fname: 'Институт информационных технологий и управления в технических системах '}
  chair1  = {name: 'Машиностроения', number: 21}
  depart1 = {sname: 'ТИ', fname: 'Технологический институт'}
  role1 = RoleUser.new(user: user_one, role: Role.where(name: 'Secretary').first, department: {dept: chair})
  specify {role1.should be_valid}
end
