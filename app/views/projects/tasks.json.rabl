child :project_tasks, :root => "tasks", :object_root => false do
    attributes :id, :name, :description, :begin_date, :end_date
    child(:project_status) { attributes :id, :name, :color }
    glue :project_status do
      attributes :name => :status
    end
end