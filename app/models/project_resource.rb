class ProjectResource < Base
  def name
    self.value
  end
  def owner_name
    self.owner.name
  end
  def time
    if self.end_date && self.begin_date
      ((self.end_date - self.begin_date) / 1.hour).round
    else
      nil
    end
  end
  belongs_to :resource_type
  belongs_to :project_task
  def project
    self.project_task.project
  end
  belongs_to :resoursable, polymorphic: true, :dependent => :destroy
end
