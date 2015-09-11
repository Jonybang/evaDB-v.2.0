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

users_list = [
    [ 'test@mail.ru', 'test', 'Тестовый Пользователь' ],
    [ 'jonybang@mail.ru', 'Jb192837', 'Паничев Евгений' ],
    [ 'ger2001a@mail.ru', '12345', 'Ледков Евгений' ]
]

users_list.each do |email, pass, name|
  user = User.create(email: email, password: pass)
  user.contact = Contact.new(name: name)
  user.contact.contact_data = ContactDatum.create({email: email})
end



project_task_status_list = [
    [ 'Активная', '#5cb85c', 'active' ],
    [ 'Отложенная', '#f0ad4e', 'frozen' ],
    [ 'Будущая', '#5bc0de', 'future' ],
    [ 'Завершенная', '#428bca', 'closed' ]
]

project_task_status_list.each do |name, color, role|
  ProjectTaskStatus.create( name: name, color: color, role: role )
end

first_project = Project.create(name:'Первый проект', description: 'Описание к первому проекту', chief: Contact.first)

project_tasks_list = [
    [ 'Первая задача', '2015-08-11', '2015-08-20' ],
    [ 'Вторая задача', '2015-08-16', '2015-08-25' ],
    [ 'Третья задача', '2015-08-26', '2015-08-30' ]
]

project_tasks_list.each do |name, begin_date, end_date|
  offset = rand(ProjectTaskStatus.count)
  first_project.project_tasks << ProjectTask.create(name: name, begin_date: begin_date, end_date: end_date, status: ProjectTaskStatus.offset(offset).first)
end

Equip.create(name: 'Оборудование 1')
Equip.create(name: 'Оборудование 2')
Equip.create(name: 'Оборудование 3')

project_resources_list = [
    [ '2015-08-11 [08:00:00]', '2015-08-11 [12:00:00]' ],
    [ '2015-08-13 [12:00:00]', '2015-08-13 [18:00:00]' ],
    [ '2015-08-14 [10:00:00]', '2015-08-14 [16:00:00]' ],
    [ '2015-08-15 [10:00:00]', '2015-08-15 [16:00:00]' ]
]
project_resources_list.each do |begin_date, end_date|
  offset = rand(Contact.count)
  ProjectTask.first.resources << ProjectResource.create(begin_date: begin_date, end_date: end_date, resoursable: Contact.offset(offset).first)
end

project_resources_list = [
    [ '2015-08-16 [08:00:00]', '2015-08-16 [11:00:00]' ],
    [ '2015-08-17 [10:00:00]', '2015-08-17 [18:00:00]' ],
    [ '2015-08-19 [12:00:00]', '2015-08-19 [16:00:00]' ]
]
project_resources_list.each do |begin_date, end_date|
  offset = rand(Contact.count)
  ProjectTask.find(2).resources << ProjectResource.create(begin_date: begin_date, end_date: end_date, resoursable: Contact.offset(offset).first)
end