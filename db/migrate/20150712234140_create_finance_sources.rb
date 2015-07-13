class CreateFinanceSources < ActiveRecord::Migration
  def change
    create_table :finance_sources do |t|
      t.string :name, null: false
      t.float :volume_from
      t.float :volume_to

      t.belongs_to :currency, index: true

      t.timestamps null: false
    end
  end
end
