class ProjectDirection < Base
  has_many :projects, inverse_of: :project_direction
  #accepts_nested_attributes_for :projects

  has_and_belongs_to_many :finance_sources, class_name: 'FinanceSource', inverse_of: :project_directions
end
