class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description
      t.references :tab, index: true
      t.timestamps
    end
  end
end
