class CreateProjectTaskStatuses < ActiveRecord::Migration
  def change
    create_table :project_task_statuses do |t|
      t.string :name, null: false
      t.string :color
      t.string :role

      t.timestamps null: false
    end
  end
end
