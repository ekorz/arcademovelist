class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.references :tabable, polymorphic: true, index: true
      t.string :tab_type
      t.timestamps
    end
  end
end
