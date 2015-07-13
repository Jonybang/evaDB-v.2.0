class AddLinkRefToPolymorph < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :linkable, polymorphic: true, index: true
    end
  end
end