class CreateContactsProjects < ActiveRecord::Migration
  def change
    create_table :contacts_projects, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :project, index: true
    end
  end
end
