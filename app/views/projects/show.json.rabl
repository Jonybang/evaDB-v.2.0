object @resource
attribute :id, :name, :created_at, :updated_at
attribute :description, :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }
child :chief => :contact do
    attributes :id, :name
end
child :project_tasks, :root => "tasks", :object_root => false do
    attributes :id, :name
end