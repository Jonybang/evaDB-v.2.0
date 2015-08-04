class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description
      t.string :result
      t.datetime :begin_date
      t.datetime :end_date

      t.belongs_to :status, index: true
      t.belongs_to :project_direction, index: true
      t.belongs_to :contact, index: true

      t.timestamps null: false
    end
  end
end
