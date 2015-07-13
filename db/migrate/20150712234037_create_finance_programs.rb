class CreateFinancePrograms < ActiveRecord::Migration
  def change
    create_table :finance_programs do |t|
      t.string :name, null: false
      t.string :terms

      t.belongs_to :finance_source, index: true

      t.timestamps null: false
    end
  end
end
