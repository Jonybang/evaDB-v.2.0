child :project_tasks, :root => "tasks", :object_root => false do
    attributes :id, :name, :description, :begin_date, :end_date
    child(:status => :status) { attributes :id, :name, :color }
    glue :status do
      attributes :name => :status_name
    end
end