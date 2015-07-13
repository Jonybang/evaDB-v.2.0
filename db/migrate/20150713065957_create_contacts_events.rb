class CreateContactsEvents < ActiveRecord::Migration
  def change
    create_table :contacts_events, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :event, index: true
    end
  end
end