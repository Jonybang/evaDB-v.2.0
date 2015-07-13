class CreateFinanceSourcesProjects < ActiveRecord::Migration
  def change
    create_table :finance_sources_projects, id: false do |t|
      t.belongs_to :finance_source, index: true
      t.belongs_to :project, index: true
    end
  end
end