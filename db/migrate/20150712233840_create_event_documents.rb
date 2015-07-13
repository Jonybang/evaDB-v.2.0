class CreateEventDocuments < ActiveRecord::Migration
  def change
    create_table :event_documents do |t|
      t.string :name, null: false
      t.string :comments
      t.string :to_do
      t.string :url

      t.belongs_to :event, index:true

      t.timestamps null: false
    end
  end
end
