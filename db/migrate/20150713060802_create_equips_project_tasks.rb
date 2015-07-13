class CreateEquipsProjectTasks < ActiveRecord::Migration
  def change
    create_table :equips_project_tasks, id: false do |t|
      t.belongs_to :equip, index: true
      t.belongs_to :project_task, index: true
    end
  end
end
