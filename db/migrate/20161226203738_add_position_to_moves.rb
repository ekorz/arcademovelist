class AddPositionToMoves < ActiveRecord::Migration
  def change
  	add_column :moves, :position, :integer
  end
end
