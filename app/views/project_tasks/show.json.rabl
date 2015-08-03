object @resource

extends "inherits/base"

attribute :description, :number, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }

glue :project_status do
  attributes :id => :project_status_id
end

node :responsible_ids do |task|
  task.responsible.map {|r| r.id }
end

child :project do
    attributes :id, :name
end

child :resources, :root => "resources", :object_root => false do
    attributes :id, :value, :resoursable_id, :resoursable_type, :begin_date, :end_date
end

child :responsible, :root => "responsible", :object_root => false do
    attributes :id, :name
end