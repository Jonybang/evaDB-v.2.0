class CreateExpertsEvents < ActiveRecord::Migration
  def change
    create_table :experts_events, id: false  do |t|
      t.belongs_to :partner, index: true
      t.belongs_to :event, index: true
    end
  end
end
