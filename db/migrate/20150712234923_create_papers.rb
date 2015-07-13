class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :name, null: false

      t.belongs_to :scientist, index: true

      t.timestamps null: false
    end
  end
end
