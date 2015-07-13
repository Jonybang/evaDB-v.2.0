class CreateContactsProjectTasks < ActiveRecord::Migration
  def change
    create_table :contacts_project_tasks, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :project_task, index: true
    end
  end
end
