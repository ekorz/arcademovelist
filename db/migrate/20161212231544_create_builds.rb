class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.boolean :moves
      t.boolean :fatalities
      t.references :tab, index: true
      t.timestamps
    end
  end
end
