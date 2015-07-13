class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false

      t.belongs_to :subunit, index: true

      t.timestamps null: false
    end
  end
end
