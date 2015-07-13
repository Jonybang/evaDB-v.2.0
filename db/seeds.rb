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