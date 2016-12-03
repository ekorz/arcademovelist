class CreateFatalities < ActiveRecord::Migration
  def change
    create_table :fatalities do |t|
      t.string :name
      t.text :description
      t.references :tab, index: true
      t.timestamps
    end
  end
end
