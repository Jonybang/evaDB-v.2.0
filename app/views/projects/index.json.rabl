collection @collection

extends "inherits/base"

attribute :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }
child :chief => :contact do
    attributes :id, :name
end

if @with_tasks
    extends "projects/tasks"
end