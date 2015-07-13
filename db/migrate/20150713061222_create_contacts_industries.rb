class CreateContactsIndustries < ActiveRecord::Migration
  def change
    create_table :contacts_industries, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :industry, index: true
    end
  end
end
