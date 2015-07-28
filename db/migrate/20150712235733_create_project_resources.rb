class CreateProjectResources < ActiveRecord::Migration
  def change
    create_table :project_resources do |t|
      t.string :value, null: false

      t.belongs_to :resource_type, index: true
      t.belongs_to :project, index: true
      t.belongs_to :project_task, index: true

      t.timestamps null: false
    end
  end
end
