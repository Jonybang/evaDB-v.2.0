class CreateProjectDirections < ActiveRecord::Migration
  def change
    create_table :project_directions do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
