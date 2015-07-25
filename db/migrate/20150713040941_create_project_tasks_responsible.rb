class CreateProjectTasksResponsible < ActiveRecord::Migration
  def change
    create_table :project_tasks_responsible, id: false do |t|
      t.belongs_to :project_task, index: true
      t.belongs_to :contact, index: true
    end
  end
end
