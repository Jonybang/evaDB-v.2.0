class AddContactDataRefToPolymorph < ActiveRecord::Migration
  def change
    change_table :contact_data do |t|
      t.references :cdata_parent, polymorphic: true, index: true
    end
  end
end
