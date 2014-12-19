
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

person_one = Person.create({last_name: 'Sundukova', first_name: 'Olga', second_name: 'Alexandrovna', 
                    birthday: Date.today - 23.years})
person_two = Person.create({last_name: 'Bogdanova', first_name: 'Anna', second_name: 'Evgenievna', 
                    birthday: Date.today - 22.years})
user_one = User.create(login: 'soa40')
user_two = User.create(login: 'bae12')

#person_one.user = user_one
#person_two.user = user_two


role1 = Role.create({name: 'Admin', priority: 0})
role2 = Role.create({name: 'Chairman', priority: 1})
role3 = Role.create({name: 'Secretary', priority: 2})
role4 = Role.create({name: 'Ozis', priority: 3})
role5 = Role.create({name: 'Nis', priority: 4})
role6 = Role.create({name: 'Director', priority: 5})
role7 = Role.create({name: 'Rector', priority: 6})

dep1 = Department.create({short_name: "ИИТУ", full_name: "Институт информационных технологий и управления в технических системах"})
dep2 = Department.create({short_name: "ТИ", full_name: "Технологический институт"})
dep3 = Department.create({short_name: "ИЭТС", full_name: "Институт энергетики и транспортных систем"})
dep4 = Department.create({short_name: "ЮИ", full_name: "Юридический институт"})
dep5 = Department.create({short_name: "ИЭУ", full_name: "Институт экономики и управления"})
dep6 = Department.create({short_name: "СГТИ", full_name: "Институт социальных и гуманитарных технологий"})
dep7 = Department.create({short_name: "ИДО", full_name: "Институт дистанционного образования"})


ch1 = Chair.create({name: "ИВЦ", number: 11, department: dep1})
role_one = RoleUser.create({user: user_one, role: role1})
role_two = RoleUser.create({user: user_one, role: role3, dept: ch1})
role_three = RoleUser.create({user: user_two, role: role6, dept: dep1})



