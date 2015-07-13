class Equip < Base
  belongs_to :responsible, class_name: 'Contact', inverse_of: :equips
  belongs_to :organization
  belongs_to :subunit
  belongs_to :room
  belongs_to :equip_status

  has_and_belongs_to_many :project_tasks, class_name: 'ProjectTask', inverse_of: :equips
  #accepts_nested_attributes_for :project_tasks

  has_many :project_resources, as: :resoursable, class_name: 'ProjectResource'
  #accepts_nested_attributes_for :project_resources
end
