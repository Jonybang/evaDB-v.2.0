# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project_status_list = [
    [ 'Подготовка', '#5bc0de' ],
    [ 'Завершен', '#5cb85c' ],
    [ 'Приостановлен', '#f0ad4e' ],
    [ 'Отменен', '#d9534f' ],
    [ 'В процессе', '#428bca' ]
]

project_status_list.each do |name, color|
  ProjectStatus.create( name: name, color: color )
end

jonybang = User.create(email:'jonybang@mail.ru', password: 'Jb192837')
jonybang.contact = Contact.new(name:'Паничев Евгений')
jonybang.contact.contact_data = ContactDatum.create({email:jonybang.email})

ledkov = User.create(email:'ger2001a@mail.ru', password: '12345')
ledkov.contact = Contact.new(name:'Ледков Евгений')
ledkov.contact.contact_data = ContactDatum.create({email:ledkov.email})

Project.create(name:'Первый проект', description: 'Описание к первому проекту', chief: jonybang.contact)

Contact.create(name: 'Контакт 1')
Contact.create(name: 'Контакт 2')
Contact.create(name: 'Студент 1')
Contact.create(name: 'Студент 2')