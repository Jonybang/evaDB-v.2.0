class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :result, type: String

  field :begin_date, type: DateTime
  field :end_date, type: DateTime

  has_many :project_tasks, class_name: "ProjectTask", dependent: :delete
  accepts_nested_attributes_for :project_tasks

  has_many :resources, class_name: "ProjectResource", inverse_of: :project
  accepts_nested_attributes_for :resources

  belongs_to :project_status
  belongs_to :project_direction
  belongs_to :chief, class_name: "Contact", inverse_of: :chief_projects

  has_and_belongs_to_many :intellect_properties, class_name: "IntellectProperty"
  has_and_belongs_to_many :team, class_name: "Contact", inverse_of: :team_projects
  has_and_belongs_to_many :experts, class_name: "Contact", inverse_of: :expert_projects
  has_and_belongs_to_many :finance_sources, class_name: "FinanceSource"

  def main_tasks
    self.project_tasks.where(parent_task: nil)
  end
end
