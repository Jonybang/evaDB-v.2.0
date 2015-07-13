class ProjectStatus < Base
   has_many :projects, inverse_of: :project_status
   #accepts_nested_attributes_for :projects
   has_many :project_tasks, inverse_of: :project_status
   #accepts_nested_attributes_for :project_tasks
end
