class CreateWorkPosts < ActiveRecord::Migration
  def change
    create_table :work_posts do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
