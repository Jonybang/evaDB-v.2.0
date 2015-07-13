class CreateIntellectProperties < ActiveRecord::Migration
  def change
    create_table :intellect_properties do |t|
      t.string :name, null: false
      t.string :ind_number
      t.string :description
      t.string :formula
      t.date :reg_date
      t.date :end_date
      t.string :doc_link

      t.belongs_to :intellect_type, index: true

      t.timestamps null: false
    end
  end
end
