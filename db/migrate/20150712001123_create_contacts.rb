class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.date :enter_year

      t.belongs_to :user, index: true
      t.belongs_to :organization, index: true
      t.belongs_to :work_post, index: true

      # Студент
      t.belongs_to :specialty, index: true
      t.belongs_to :faculty, index: true
      t.belongs_to :university, index: true

      # Ученый
      t.belongs_to :degree, index: true
      t.belongs_to :rank, index: true

      t.string :type

      t.timestamps null: false
    end
  end
end
