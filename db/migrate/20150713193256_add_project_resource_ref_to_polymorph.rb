class AddProjectResourceRefToPolymorph < ActiveRecord::Migration
  def change
    change_table :project_resources do |t|
      t.references :resoursable, polymorphic: true, index: true
    end
  end
end