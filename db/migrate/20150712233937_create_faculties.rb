class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name, null: false

      t.belongs_to :university, index: true

      t.timestamps null: false
    end
  end
end
