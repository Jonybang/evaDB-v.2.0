object @resource

extends "inherits/base"

attribute :description, :number, :begin_date, :end_date

child(:status => :status) { attributes :id, :name, :color, :role }

glue :status do
  attributes :id => :status_id
end

node :responsible_ids do |task|
  task.responsible.map {|r| r.id }
end

child :project do
    attributes :id, :name
end

child :resources, :root => "resources", :object_root => false do
    attributes :id
    extends "project_resources/base"
end

child :responsible, :root => "responsible", :object_root => false do
    attributes :id, :name
end