class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.string :name, null: false
      t.string :color

      t.timestamps null: false
    end
  end
end
