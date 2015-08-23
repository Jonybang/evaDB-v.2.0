attributes :value, :resoursable_id, :resoursable_type, :begin_date, :end_date

node :resoursable_class do |resource|
    resource.resoursable.class.name
end

glue :project_task do
  attributes :id => :project_task_id
end

child :project_task => :task do
    attributes :id, :name
    glue :project do
      attributes :name => :project_name
    end
end

child :resoursable => :resoursable do
    attributes :id, :name
end

node :time do |resource|
    resource.time
end