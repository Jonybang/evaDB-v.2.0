class CreateContactsSkills < ActiveRecord::Migration
  def change
    create_table :contacts_skills, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :skill, index: true
    end
  end
end
