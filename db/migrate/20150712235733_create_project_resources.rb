class CreateProjectResources < ActiveRecord::Migration
  def change
    create_table :project_resources do |t|
      t.string :value
      t.datetime :begin_date
      t.datetime :end_date

      t.belongs_to :resource_type, index: true
      t.belongs_to :project_task, index: true

      t.timestamps null: false
    end
  end
end
