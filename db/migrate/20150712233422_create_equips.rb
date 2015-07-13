class CreateEquips < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.string :name, null: false
      t.string :model
      t.string :description
      t.string :parameters

      t.belongs_to :contact, index:true
      t.belongs_to :organization, index:true
      t.belongs_to :subunit, index:true
      t.belongs_to :room, index:true
      t.belongs_to :equip_status, index:true

      t.timestamps null: false
    end
  end
end
