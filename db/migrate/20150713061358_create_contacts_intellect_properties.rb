class CreateContactsIntellectProperties < ActiveRecord::Migration
  def change
    create_table :contacts_intellect_properties, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :intellect_property, index: true
    end
  end
end