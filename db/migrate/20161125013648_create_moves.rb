class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.text :description
      t.references :game, index: true
      t.references :character, index: true

      t.timestamps
    end
  end
end
