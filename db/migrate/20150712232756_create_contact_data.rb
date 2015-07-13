class CreateContactData < ActiveRecord::Migration
  def change
    create_table :contact_data do |t|
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
