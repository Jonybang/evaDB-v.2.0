collection @collection
attribute :id, :name, :created_at, :updated_at
attribute :begin_date, :end_date

child(:project_status) { attributes :id, :name, :color }
child :chief => :contact do
    attributes :id, :name
end

if @with_tasks
    child :project_tasks, :root => "tasks", :object_root => false do
        attributes :id, :name, :begin_date, :end_date
        child(:project_status) { attributes :id, :name, :color }
    end
end