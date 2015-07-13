class CreateSubunits < ActiveRecord::Migration
  def change
    create_table :subunits do |t|
      t.string :name, null: false

      t.belongs_to :organization, index: true

      t.timestamps null: false
    end
  end
end
