object @resource
attribute :id, :name, :created_at, :updated_at
attribute :description, :number, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }

glue :project_status do
  attributes :id => :project_status_id
end

child :responsible => :contact do
    attributes :id, :name
end
child :project do
    attributes :id, :name
end
child :performers, :root => "performers", :object_root => false do
    attributes :id, :name
end