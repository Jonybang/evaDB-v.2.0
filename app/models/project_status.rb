class ProjectStatus < Base
   has_many :projects, inverse_of: :status
   #accepts_nested_attributes_for :projects
end
