object @resource

extends "inherits/base"

attribute :description, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }
child :chief => :contact do
    attributes :id, :name
end

extends "projects/tasks"