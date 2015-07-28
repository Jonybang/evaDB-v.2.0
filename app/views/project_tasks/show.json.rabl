object @resource
attribute :id, :name, :created_at, :updated_at
attribute :description, :number, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }

glue :project_status do
  attributes :id => :project_status_id
end

node :responsible_ids do |resource|
  resource.responsible.map {|r| r.id }
end

child :project do
    attributes :id, :name
end

child :resources, :root => "resources", :object_root => false do
    attributes :id, :name
end

child :responsible, :root => "responsible", :object_root => false do
    attributes :id, :name
end