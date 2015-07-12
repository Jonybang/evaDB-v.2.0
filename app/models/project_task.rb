class ProjectTask
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :number, type: Integer

  field :begin_date, type: DateTime
  field :end_date, type: DateTime

  field :description, type: String

  belongs_to :project
  belongs_to :parent_task, class_name: "ProjectTask", inverse_of: :project_tasks
  belongs_to :project_status
  belongs_to :responsible, class_name: "Contact", inverse_of: :project_tasks

  has_many :child_tasks, class_name: "ProjectTask", inverse_of: :parent_task

  has_and_belongs_to_many :performers, class_name: "Contact", inverse_of: :performer_tasks
  accepts_nested_attributes_for :performers

  has_and_belongs_to_many :equips, class_name: "Equip"

  def self.has_contact(contact_id)
    where( 'project.chief' => Contact.find(contact_id) )
  end
end
