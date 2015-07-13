class CreateProjectTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks do |t|
      t.string :name, null: false
      t.integer :number
      t.datetime :begin_date
      t.datetime :end_date
      t.string :description

      t.belongs_to :project, index: true
      t.belongs_to :parent_task, index: true
      t.belongs_to :project_status, index: true
      t.belongs_to :contact, index: true

      t.timestamps null: false
    end
  end
end
