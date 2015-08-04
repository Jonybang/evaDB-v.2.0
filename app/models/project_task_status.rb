class ProjectTaskStatus < Base
   has_many :project_tasks, inverse_of: :status
   #accepts_nested_attributes_for :project_tasks
end
