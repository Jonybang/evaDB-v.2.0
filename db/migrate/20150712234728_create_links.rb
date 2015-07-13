class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :note

      t.belongs_to :socnet, index: true

      t.timestamps null: false
    end
  end
end
