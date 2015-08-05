class ProjectTask < Base
  #after_touch :set_status

  belongs_to :project
  belongs_to :parent_task, class_name: 'ProjectTask', inverse_of: :child_tasks#, foreign_key: :parent_task_id
  belongs_to :status, class_name: 'ProjectTaskStatus', inverse_of: :project_tasks

  has_many :child_tasks, class_name: 'ProjectTask', inverse_of: :parent_task, foreign_key: :parent_task_id

  has_many :resources, class_name: 'ProjectResource', inverse_of: :project_task

  has_and_belongs_to_many :responsible, class_name: 'Contact', inverse_of: :responsible_tasks

  #has_and_belongs_to_many :performers, class_name: 'Contact', inverse_of: :performer_tasks
  #accepts_nested_attributes_for :performers

  has_and_belongs_to_many :equips, class_name: 'Equip', inverse_of: :project_tasks

  def self.has_contact(contact_id)
    where( 'project.chief' => Contact.find(contact_id) )
  end

  private
  def set_status
    logger.debug "set status"
    #if self.status.role == 'future' && Date.today > self.begin_date
      #self.status = ProjectTaskStatus.find_by role: 'active'
      #self.save
    #end
  end
end
