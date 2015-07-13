class CreateSocnets < ActiveRecord::Migration
  def change
    create_table :socnets do |t|
      t.string :name, null: false
      t.string :url

      t.timestamps null: false
    end
  end
end
