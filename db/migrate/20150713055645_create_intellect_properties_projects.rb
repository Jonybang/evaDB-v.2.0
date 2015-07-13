class CreateIntellectPropertiesProjects < ActiveRecord::Migration
  def change
    create_table :intellect_properties_projects, id: false do |t|
      t.belongs_to :intellect_property, index: true
      t.belongs_to :project, index: true
    end
  end
end
